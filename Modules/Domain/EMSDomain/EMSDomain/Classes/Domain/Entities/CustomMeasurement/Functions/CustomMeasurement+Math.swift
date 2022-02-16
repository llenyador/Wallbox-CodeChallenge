//
//  CustomMeasurement+Math.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 12/2/22.
//

import SharedUtilities

public func abs<Unit: UnitProtocol>(_ measurement: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
    .init(abs(measurement.value))
}

public func *<Unit: UnitProtocol>(
    lhs: CustomMeasurement<Unit>,
    rhs: CustomMeasurement<Unit>
) -> CustomMeasurement<Unit> {
    .init(lhs.value * rhs.value)
}

public func /<Unit: UnitProtocol>(
    lhs: CustomMeasurement<Unit>,
    rhs: CustomMeasurement<Unit>
) -> CustomMeasurement<Unit> {
    .init(lhs.value / rhs.value)
}

// MARK: - AdditiveArithmetic
extension CustomMeasurement: AdditiveArithmetic {
    public static func + (lhs: CustomMeasurement<Unit>,
                          rhs: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
        .init(lhs.value + rhs.value)
    }

    public static func - (lhs: CustomMeasurement<Unit>,
                          rhs: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
        .init(lhs.value - rhs.value)
    }
}

// MARK: - Numeric
extension CustomMeasurement: Numeric {
    public typealias Magnitude = Double

    public init?<T>(exactly source: T) where T : BinaryInteger {
        self.init(source.doubleValue)
    }

    public var magnitude: Double {
        value
    }

    public static func *= (lhs: inout CustomMeasurement<Unit>, rhs: CustomMeasurement<Unit>) {
        lhs.value *= rhs.value
    }
}

public extension CustomMeasurement {
    func asPercentage(
        forTotal total: Self
    ) -> Double {
        (
            (value / total.value) * 100
        ).round(toDecimals: 2)
    }
}
