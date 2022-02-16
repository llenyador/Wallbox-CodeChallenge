//
//  CustomMeasurement.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

public struct CustomMeasurement<Unit: UnitProtocol> {
    public var value: Double

    public init(_ value: Double) {
        self.value = value
    }
}

public extension CustomMeasurement {
    /// Converts measurement to another unit of the same family.
    func converted<TargetUnit>(
        to target: TargetUnit.Type
    ) -> CustomMeasurement<TargetUnit>
    where TargetUnit: UnitProtocol, TargetUnit.Family == Unit.Family
    {
        let valueInBaseUnit = Unit.converter.baseUnitValue(fromValue: value)
        let valueInTargetUnit = TargetUnit.converter.value(fromBaseUnitValue: valueInBaseUnit)
        return CustomMeasurement<TargetUnit>(valueInTargetUnit)
    }
}

// MARK: - Equatable
extension CustomMeasurement: Equatable {}

// MARK: - Comparable
extension CustomMeasurement: Comparable {
    public static func < (lhs: CustomMeasurement<Unit>, rhs: CustomMeasurement<Unit>) -> Bool {
        lhs.value < rhs.value
    }
}

// MARK: - AdditiveArithmetic
extension CustomMeasurement: AdditiveArithmetic {
    public static func + (lhs: CustomMeasurement<Unit>,
                          rhs: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
        .init(lhs.value + rhs.value)
    }

    public static func + (lhs: CustomMeasurement<Unit>,
                          rhs: Double) -> CustomMeasurement<Unit> {
        .init(lhs.value + rhs)
    }

    public static func + (lhs: Double,
                          rhs: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
        .init(lhs + rhs.value)
    }

    public static func - (lhs: CustomMeasurement<Unit>,
                          rhs: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
        .init(lhs.value - rhs.value)
    }

    public static func - (lhs: CustomMeasurement<Unit>,
                          rhs: Double) -> CustomMeasurement<Unit> {
        .init(lhs.value - rhs)
    }

    public static func - (lhs: Double,
                          rhs: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
        .init(lhs - rhs.value)
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

// MARK: - Division
extension CustomMeasurement {
    public static func / (lhs: inout CustomMeasurement<Unit>, rhs: CustomMeasurement<Unit>) -> CustomMeasurement<Unit> {
        .init( lhs.value / rhs.value )
    }
}

// MARK: - CustomStringConvertible
extension CustomMeasurement: CustomStringConvertible {
    public var description: String {
        return "\(value) \(Unit.symbol)"
    }
}

// MARK: - ExpressibleByIntegerLiteral
extension CustomMeasurement: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = value.doubleValue
    }
}

// MARK: - ExpressibleByFloatLiteral
extension CustomMeasurement: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.value = value
    }
}
