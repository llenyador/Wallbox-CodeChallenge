//
//  Power.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

// MARK: - Family
public enum Power: UnitFamilyProtocol {
    public typealias BaseUnit = Watt
}

// MARK: - Units
public enum Watt: UnitProtocol {
    public typealias Family = Power

    public static let symbol = "W"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 1)
}

public enum KiloWatt: UnitProtocol {
    public typealias Family = Power

    public static let symbol = "kW"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 1000)
}
