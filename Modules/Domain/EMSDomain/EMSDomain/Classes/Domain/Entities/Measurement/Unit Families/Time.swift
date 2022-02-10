//
//  Time.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

// MARK: - Family
public enum Time: UnitFamilyProtocol {
    public typealias BaseUnit = Second
}

// MARK: - Units
public enum Second: UnitProtocol {
    public typealias Family = Time

    public static let symbol = "s"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 1)
}

public enum Minute: UnitProtocol {
    public typealias Family = Time

    public static let symbol = "min"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 60)
}

public enum Hour: UnitProtocol {
    public typealias Family = Time

    public static let symbol = "hr"
    public static let converter: UnitConverter = UnitConverterLinear(coefficient: 3600)
}
