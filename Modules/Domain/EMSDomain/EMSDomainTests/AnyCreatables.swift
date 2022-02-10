//
//  AnyCreatables.swift
//  EMSDomain-Unit-EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedTestingUtilities
@testable import EMSDomain

extension CustomMeasurement: AnyCreatable {
    public static var any: CustomMeasurement<Unit> {
        .init(.any)
    }
}

extension LiveData: AnyCreatable {
    public static var any: Self {
        .init(
            solarPower: .any,
            quasarsPower: .any,
            gridPower: .any,
            buildingDemand: .any,
            systemSoc: .any,
            totalEnergy: .any,
            currentEnergy: .any
        )
    }
}

extension HistoricalData: AnyCreatable {
    public static var any: Self {
        .init(
            buildingActivePower: .any,
            gridActivePower: .any,
            pvActivePower: .any,
            quasarsActivePower: .any,
            timestamp: .distantPast
        )
    }
}

extension HistoricalDataDTO: AnyCreatable {
    public static var any: Self {
        .init(
            buildingActivePower: .any,
            gridActivePower: .any,
            pvActivePower: .any,
            quasarsActivePower: .any,
            timestamp: .distantPast
        )
    }
}

extension LiveDataDTO: AnyCreatable {
    public static var any: Self {
        .init(
            solarPower: .any,
            quasarsPower: .any,
            gridPower: .any,
            buildingDemand: .any,
            systemSoc: .any,
            totalEnergy: .any,
            currentEnergy: .any
        )
    }
}