//
//  UnitProtocol.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

/// Represents a unit of measurement.
public protocol UnitProtocol {
    associatedtype Family: UnitFamilyProtocol

    static var symbol: String { get }
    static var converter: UnitConverter { get }
}
