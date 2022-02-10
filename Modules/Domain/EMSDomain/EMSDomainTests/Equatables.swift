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
        lhs.quasarsPower == rhs.quasarsPower &&
        lhs.gridPower == rhs.gridPower &&
        lhs.buildingDemand == rhs.buildingDemand &&
        lhs.systemSoc == rhs.systemSoc &&
        lhs.totalEnergy == rhs.totalEnergy &&
        lhs.currentEnergy == rhs.currentEnergy
    }
}

extension HistoricalData: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.buildingActivePower == rhs.buildingActivePower &&
        lhs.gridActivePower == rhs.gridActivePower &&
        lhs.pvActivePower == rhs.pvActivePower &&
        lhs.quasarsActivePower == rhs.quasarsActivePower &&
        lhs.timestamp == rhs.timestamp
    }
}
