//
//  Equatables.swift
//  EMSDomain-Unit-EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

@testable import EMSDomain

extension LiveData: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.solarPower == rhs.solarPower &&
        lhs.quasarsPowerStatus == rhs.quasarsPowerStatus &&
        lhs.gridPower == rhs.gridPower &&
        lhs.buildingDemandPower == rhs.buildingDemandPower &&
        lhs.systemSoc == rhs.systemSoc &&
        lhs.totalEnergy == rhs.totalEnergy &&
        lhs.currentEnergy == rhs.currentEnergy
    }
}

extension QuasarPowerStatus: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.supplyingEnergy(lhsPower), .supplyingEnergy(rhsPower)):
            return lhsPower == rhsPower
        case let (.consumingEnergy(lhsPower), .consumingEnergy(rhsPower)):
            return lhsPower == rhsPower
        default:
            return false
        }
    }
}

extension HistoricalData: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.buildingActivePower == rhs.buildingActivePower &&
        lhs.gridActivePower == rhs.gridActivePower &&
        lhs.pvActivePower == rhs.pvActivePower &&
        lhs.quasarsActivePowerStatus == rhs.quasarsActivePowerStatus &&
        lhs.timestamp == rhs.timestamp
    }
}

extension QuasarsEnergyResume: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.consumedEnergy == rhs.consumedEnergy &&
        lhs.suppliedEnergy == rhs.suppliedEnergy &&
        lhs.suppliedEnergyPercentage == rhs.suppliedEnergyPercentage &&
        lhs.consumedEnergyPercentage == rhs.consumedEnergyPercentage
    }
}
