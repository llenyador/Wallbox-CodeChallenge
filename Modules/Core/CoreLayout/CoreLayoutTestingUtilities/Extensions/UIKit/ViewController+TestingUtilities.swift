//
//  ViewController+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 15/2/22.
//

import UIKit

public extension UIViewController {
    func viewOfType<V: UIView, A>(_ type: V.Type, accessibility: A?) -> V?
        where A: RawRepresentable, A.RawValue == String {
            if let view = view.viewOfType(type.self, accessibility: accessibility) {
                return view
            } else {
                return navigationItem.viewOfType(type.self, accessibility: accessibility)
            }
    }

    func viewOfType<V: UIView>(_ type: V.Type) -> V? {
        let emptyAccessibility = Optional<EmptyAccessibility>.none
        return viewOfType(type, accessibility: emptyAccessibility)
    }
}
