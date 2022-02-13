//
//  QuasarPowerStatus.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 12/2/22.
//

public enum QuasarPowerStatus {
    case supplyingEnergy(CustomMeasurement<KiloWatt>)
    case consumingEnergy(CustomMeasurement<KiloWatt>)

    public var power: CustomMeasurement<KiloWatt> {
        switch self {
        case let .supplyingEnergy(power):
            return power
        case let .consumingEnergy(power):
            return power
        }
    }
}
