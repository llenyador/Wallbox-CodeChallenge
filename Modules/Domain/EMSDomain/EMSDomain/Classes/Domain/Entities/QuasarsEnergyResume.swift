//
//  QuasarsEnergyResume.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 16/2/22.
//

public struct QuasarsEnergyResume {
    public let consumedEnergy: CustomMeasurement<KiloWattHour>
    public let suppliedEnergy: CustomMeasurement<KiloWattHour>
    public let suppliedEnergyPercentage: Double
    public let consumedEnergyPercentage: Double
}
