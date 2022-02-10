//
//  Energy.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

// MARK: - Energy
public enum Energy: UnitFamilyProtocol {
    public typealias BaseUnit = WattHour
}

public enum WattHour: UnitProtocol {
    public typealias Family = Power

    public static let symbol = "Wh"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 1)
}

public enum KiloWattHour: UnitProtocol {
    public typealias Family = Power

    public static let symbol = "kWh"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 1000)
}

// A KiloWattHour is the result of multiplying a KiloWatt by an Hour.
extension KiloWattHour: Product {
    public typealias Factor1 = KiloWatt
    public typealias Factor2 = Hours
}
