//
//  Measurement.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

public struct Measurement<Unit: UnitProtocol> {
    public let value: Double

    public init(_ value: Double) {
        self.value = value
    }
}

public extension Measurement {
    /// Converts measurement to another unit of the same family.
    func converted<TargetUnit>(
        to target: TargetUnit.Type
    ) -> Measurement<TargetUnit>
    where TargetUnit: UnitProtocol, TargetUnit.Family == Unit.Family
    {
        let valueInBaseUnit = Unit.converter.baseUnitValue(fromValue: value)
        let valueInTargetUnit = TargetUnit.converter.value(fromBaseUnitValue: valueInBaseUnit)
        return Measurement<TargetUnit>(valueInTargetUnit)
    }
}

// MARK: - Equatable
extension Measurement: Equatable {}

// MARK: - CustomStringConvertible
extension Measurement: CustomStringConvertible {
    public var description: String {
        return "\(value) \(Unit.symbol)"
    }
}

// MARK: - ExpressibleByIntegerLiteral
extension Measurement: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = value.doubleValue
    }
}

// MARK: - ExpressibleByFloatLiteral
extension Measurement: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.value = value
    }
}
