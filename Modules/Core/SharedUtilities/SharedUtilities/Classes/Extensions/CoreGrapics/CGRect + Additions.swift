//
//  CGRect + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 30/12/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    func rectModifying(x: CGFloat? = nil,
                       y: CGFloat? = nil,
                       width: CGFloat? = nil,
                       height: CGFloat? = nil) -> CGRect {
        let newX = x ?? origin.x
        let newY = y ?? origin.y
        let newW = width ?? size.width
        let newH = height ?? size.height
        return CGRect(x: newX, y: newY, width: newW, height: newH)
    }
    
    static func rectCentered(at point: CGPoint, size: CGSize) -> CGRect {
        let zoneOrigin: CGPoint = .init(x: point.x - size.width / 2,
                                        y: point.y - size.height / 2)
        return CGRect(origin: zoneOrigin, size: size)
    }
    
    var topLeftCorner: CGPoint {
        .init(x: minX, y: minY)
    }
    
    var topRightCorner: CGPoint {
        .init(x: maxX, y: minY)
    }
    
    var bottomLeftCorner: CGPoint {
        .init(x: minX, y: maxY)
    }
    
    var bottomRightCorner: CGPoint {
        .init(x: maxX, y: maxY)
    }
    
    var center: CGPoint {
        .init(x: midX, y: midY)
    }
}
