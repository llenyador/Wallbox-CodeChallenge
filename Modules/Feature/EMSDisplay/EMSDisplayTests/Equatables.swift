//
//  Equatables.swift
//  EMSDisplay-Unit-EMSDisplayTests
//
//  Created by Aitor Salvador on 13/2/22.
//

import SharedTestingUtilities
@testable import EMSDomainMocks
@testable import EMSDisplay

extension DashboardModels.Data: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.quasarsEnergyResume == rhs.quasarsEnergyResume &&
        lhs.liveData == rhs.liveData
    }
}

extension DashboardModels.LiveData: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.quasarStatus == rhs.quasarStatus &&
        lhs.solarPower == rhs.solarPower &&
        lhs.gridPower == rhs.gridPower &&
        lhs.buildingDemandPower == rhs.buildingDemandPower
    }
}

extension DashboardModels.EnergySource: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.power == rhs.power &&
        lhs.suppliedPercentage == rhs.suppliedPercentage
    }
}

extension DashboardModels.DashboardQuasarStatus: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.supplyingEnergy(lhsEnergy), .supplyingEnergy(rhsEnergy)):
            return lhsEnergy == rhsEnergy
        case (.consumingEnergy, .consumingEnergy):
            return true
        default:
            return false
        }
    }
}
