//
//  FloatingPoint + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 05/04/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public extension BinaryFloatingPoint {
    var intValue: Int {
        Int(self)
    }

    var doubleValue: Double {
        Double(self)
    }

    var floatValue: Float {
        Float(self)
    }
}
