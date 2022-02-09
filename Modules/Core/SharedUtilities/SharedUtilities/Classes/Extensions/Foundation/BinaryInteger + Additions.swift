//
//  BinaryInteger + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 05/04/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public extension BinaryInteger {
    var doubleValue: Double {
        Double(self)
    }
    
    var isEven: Bool {
        self % 2 == 0
    }
    
    var isOdd: Bool {
        self % 2 != 0
    }
    
    func isMultiple(of value: Int) -> Bool {
        Int(self) % value == 0
    }
}
