//
//  Time.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

// MARK: - Family
public enum Time: UnitFamilyProtocol {
    public typealias BaseUnit = Seconds
}

// MARK: - Units
public enum Seconds: UnitProtocol {
    public typealias Family = Time

    public static let symbol = "s"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 1)
}

public enum Minutes: UnitProtocol {
    public typealias Family = Time

    public static let symbol = "min"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 60)
}

public enum Hours: UnitProtocol {
    public typealias Family = Time

    public static let symbol = "hr"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 3600)
}
