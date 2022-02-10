//
//  LiveData.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 9/2/22.
//

import Foundation

public typealias Percentage = Double

// To put in context to the reader:
// We are using the Measurement type because of value integrity.
// It will reduce the probability to generate unexpected bugs.
// Imagine you'll have a struct whose properties are Double values.
// Who will private you to use solarPower + totalEnergy?
// With this method, you'll be able to emit errors at compile time.
public struct LiveData {
    public let solarPower: Measurement<KiloWatt>
    public let quasarsPower: Measurement<KiloWatt>
    public let gridPower: Measurement<KiloWatt>
    public let buildingDemand: Measurement<KiloWatt>
    public let systemSoc: Percentage
    public let totalEnergy: Measurement<KiloWattHour>
    public let currentEnergy: Measurement<KiloWattHour>
}
