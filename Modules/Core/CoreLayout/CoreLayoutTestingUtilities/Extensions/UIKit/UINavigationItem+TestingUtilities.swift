//
//  UINavigationItem+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 15/2/22.
//

import UIKit

public extension UINavigationItem {
    func viewOfType<V: UIView, A>(_ type: V.Type, accessibility: A?) -> V?
        where A: RawRepresentable,
        A.RawValue == String {
            
            let allItems = rightBarButtonItems.orEmpty + leftBarButtonItems.orEmpty
            for item in allItems {
                if let view = item.customView as? V,
                    view.accessibilityIdentifier == accessibility?.rawValue {
                    return view
                }
            }
            return nil
    }
}
