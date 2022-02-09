//
//  UINavigationBar + Additions.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 30/12/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    func setTransparent() {
        setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        shadowImage = UIImage()
        isTranslucent = true
    }
}
