//
//  FixedWidthInteger+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 2/1/22.
//

import Foundation

extension AnyCreatable where Self: FixedWidthInteger {
    public static var any: Self {
        .random(in: 1...1000)
    }
}

extension AnyCreatable where Self: BinaryFloatingPoint {
    public static var any: Self {
        Self(arc4random())
    }

    public static func any(differentOf invalidValues: Set<Self>) -> Self {
        let value = Self.any
        if invalidValues.contains(value) {
            return .any(differentOf: invalidValues)
        }
        return value
    }
}

extension Int: AnyCreatable {}
extension Double: AnyCreatable {}
extension Float: AnyCreatable {}
extension CGFloat: AnyCreatable {}
