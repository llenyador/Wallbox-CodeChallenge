//
//  LiveData.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 9/2/22.
//

import Foundation

public typealias Percentage = Double

// To put in context to the reader:
// We are using the CustomMeasurement type because of value integrity.
// It will reduce the probability to generate unexpected bugs.
// Imagine you'll have a struct whose properties are Double values.
// Who would private you of using something like solarPower + totalEnergy?
// With this method, you'll be able to emit errors at compile time.
public struct LiveData {
    public let solarPower: CustomMeasurement<KiloWatt>
    public let quasarsPower: CustomMeasurement<KiloWatt>
    public let gridPower: CustomMeasurement<KiloWatt>
    public let buildingDemand: CustomMeasurement<KiloWatt>
    public let systemSoc: Percentage
    public let totalEnergy: CustomMeasurement<KiloWattHour>
    public let currentEnergy: CustomMeasurement<KiloWattHour>
}
