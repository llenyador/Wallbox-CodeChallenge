//
//  CGSize + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 30/12/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    var proportions: CGFloat {
        width / height
    }
    
    static func squared(_ size: CGFloat) -> CGSize {
        CGSize(width: size, height: size)
    }

    func width(forHeight height: CGFloat) -> CGFloat {
        CGFloat(ceil(proportions * height))
    }

    func height(forWidth width: CGFloat) -> CGFloat {
        CGFloat(ceil(width / proportions))
    }

    func size(forHeight height: CGFloat) -> CGSize {
        CGSize(width: width(forHeight: height), height: height)
    }

    func size(forWidth width: CGFloat) -> CGSize {
        CGSize(width: width, height: height(forWidth: width))
    }
}
