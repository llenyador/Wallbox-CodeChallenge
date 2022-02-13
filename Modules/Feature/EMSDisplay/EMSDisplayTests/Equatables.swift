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

extension DashboardModels.QuasarStatus: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.providingEnergy(lhsEnergy), .providingEnergy(rhsEnergy)):
            return lhsEnergy == rhsEnergy
        case let (.consumingEnergy(lhsEnergy), .consumingEnergy(rhsEnergy)):
            return lhsEnergy == rhsEnergy
        default:
            return false
        }
    }
}
