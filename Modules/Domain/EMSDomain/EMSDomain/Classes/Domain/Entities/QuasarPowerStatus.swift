//
//  QuasarPowerStatus.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 12/2/22.
//

public enum QuasarPowerStatus {
    case providingEnergy(CustomMeasurement<KiloWatt>)
    case consumingEnergy(CustomMeasurement<KiloWatt>)

    public var power: CustomMeasurement<KiloWatt> {
        switch self {
        case let .providingEnergy(power):
            return power
        case let .consumingEnergy(power):
            return power
        }
    }
}
