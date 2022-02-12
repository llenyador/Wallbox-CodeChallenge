//
//  CustomMeasurement+Math.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 12/2/22.
//

public func abs<Unit: UnitProtocol>(_ measurement: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
    .init(abs(measurement.value))
}

public func *<Unit: UnitProtocol>(
    lhs: CustomMeasurement<Unit>,
    rhs: CustomMeasurement<Unit>
) -> CustomMeasurement<Unit> {
    .init(lhs.value * rhs.value)
}

public func *<Unit: UnitProtocol>(
    lhs: CustomMeasurement<Unit>,
    rhs: Double
) -> CustomMeasurement<Unit> {
    .init(lhs.value * rhs)
}

public func *<Unit: UnitProtocol>(
    lhs: Double,
    rhs: CustomMeasurement<Unit>
) -> CustomMeasurement<Unit> {
    .init(lhs * rhs.value)
}

public func /<Unit: UnitProtocol>(
    lhs: CustomMeasurement<Unit>,
    rhs: CustomMeasurement<Unit>
) -> CustomMeasurement<Unit> {
    .init(lhs.value / rhs.value)
}

public func /<Unit: UnitProtocol>(
    lhs: CustomMeasurement<Unit>,
    rhs: Double
) -> CustomMeasurement<Unit> {
    .init(lhs.value / rhs)
}

public func /<Unit: UnitProtocol>(
    lhs: Double,
    rhs: CustomMeasurement<Unit>
) -> CustomMeasurement<Unit> {
    .init(lhs / rhs.value)
}

