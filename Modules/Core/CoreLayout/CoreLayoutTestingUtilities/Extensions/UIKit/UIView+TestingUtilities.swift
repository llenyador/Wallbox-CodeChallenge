//
//  UIView+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 15/2/22.
//

import UIKit

enum EmptyAccessibility: String {
    @available(*, unavailable)
    case none
}

public extension UIView {
    func viewOfType<V: UIView>(_ type: V.Type) -> V? {
        let emptyAccessibility = Optional<EmptyAccessibility>.none
        return viewOfType(type, accessibility: emptyAccessibility)
    }

    func viewOfType<V: UIView, A>(_ type: V.Type, accessibility: A?) -> V?
        where A: RawRepresentable, A.RawValue == String {
            if let matchingView = self as? V {
                guard let accessibilityType = accessibility?.rawValue else {
                    return matchingView
                }
                if matchingView.accessibilityIdentifier == accessibilityType {
                    return matchingView
                }
            }
            
            for subview in subviews {
                if let matchingView = subview as? V {
                    guard let accessibilityType = accessibility?.rawValue else {
                        return matchingView
                    }
                    
                    if matchingView.accessibilityIdentifier == accessibilityType {
                        return matchingView
                    } else {
                        if let view = matchingView.viewOfType(type.self,
                                                              accessibility: accessibility) {
                            return view
                        } else {
                            continue
                        }
                    }
                } else {
                    guard let matchingView = subview.viewOfType(type.self,
                                                                accessibility: accessibility) else {
                                                                    continue
                    }
                    return matchingView
                }
            }
            return nil
    }
}
