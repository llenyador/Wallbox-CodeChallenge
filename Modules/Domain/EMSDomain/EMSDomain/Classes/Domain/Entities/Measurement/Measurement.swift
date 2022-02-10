//
//  CustomMeasurement.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

public struct CustomMeasurement<Unit: UnitProtocol> {
    public let value: Double

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
