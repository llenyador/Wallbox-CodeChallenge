//
//  UIColor + Additions.swift
//  Reorder Table Test
//
//  Created by Aitor Salvador on 27/12/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import UIKit

public extension UIColor {
    var redValue: CGFloat { return CIColor(color: self).red }
    var greenValue: CGFloat { return CIColor(color: self).green }
    var blueValue: CGFloat { return CIColor(color: self).blue }
    var alphaValue: CGFloat { return CIColor(color: self).alpha }
    
    convenience init(hexString: String, argb: Bool = false) {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (argb && cString.count != 8) || (!argb && cString.count != 6) {
            self.init(ciColor: .gray)
            return
        }
        
        var rgbValue: UInt32 = 0
        
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        if argb {
            self.init(
                red: CGFloat((rgbValue & 0x00FF_0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x0000_FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000_00FF) / 255.0,
                alpha: CGFloat((rgbValue & 0xFF00_0000) >> 24) / 255.0
            )
        } else {
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }
}
