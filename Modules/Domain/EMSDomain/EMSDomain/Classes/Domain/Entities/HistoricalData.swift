//
//  HistoricalData.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

public struct HistoricalData {
    public let buildingActivePower: CustomMeasurement<KiloWatt>
    public let gridActivePower: CustomMeasurement<KiloWatt>
    public let pvActivePower: CustomMeasurement<KiloWatt>
    public let quasarsActivePower: CustomMeasurement<KiloWatt>
    public let timestamp: Date
}
