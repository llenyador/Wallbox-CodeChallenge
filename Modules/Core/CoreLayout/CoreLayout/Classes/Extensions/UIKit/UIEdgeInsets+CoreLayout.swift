//
//  UIEdgeInsets + Additions.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 28/01/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    static func horizontal(_ padding: CGFloat) -> UIEdgeInsets {
        .init(top: 0,
              left: padding,
              bottom: 0,
              right: padding)
    }
    
    static func vertical(_ padding: CGFloat) -> UIEdgeInsets {
        .init(top: padding,
              left: 0,
              bottom: padding,
              right: 0)
    }
    
    static func verticalHorizontal(
        vertical vpadding: CGFloat,
        horizontal hpadding: CGFloat
    ) -> UIEdgeInsets {
        .init(top: vpadding,
              left: hpadding,
              bottom: vpadding,
              right: hpadding)
    }

    static func all(_ padding: CGFloat) -> UIEdgeInsets {
        .init(top: padding,
              left: padding,
              bottom: padding,
              right: padding)
    }

    var horizontal: CGFloat {
        left + right
    }

    var vertical: CGFloat {
        top + bottom
    }
}
