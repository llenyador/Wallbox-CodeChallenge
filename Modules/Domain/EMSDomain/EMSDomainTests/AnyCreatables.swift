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

extension QuasarPowerStatus: CaseIterable {
    public static var allCases: [QuasarPowerStatus] {
        [
            .supplyingEnergy(.any),
            .consumingEnergy(.any)
        ]
    }
}

extension LiveData: AnyCreatable {
    public static var any: Self {
        .init(
            solarPower: .any,
            quasarsPowerStatus: .any,
            gridPower: .any,
            buildingDemandPower: .any,
            systemSoc: .any,
            totalEnergy: .any,
            currentEnergy: .any
        )
    }

    public static func any(quasarsPowerStatus: QuasarPowerStatus) -> Self {
        .init(
            solarPower: .any,
            quasarsPowerStatus: quasarsPowerStatus,
            gridPower: .any,
            buildingDemandPower: .any,
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
            quasarsActivePowerStatus: .any,
            timestamp: .distantPast
        )
    }
}

extension HistoricalData {
    typealias CustomizedData = (quasarsStatus: QuasarPowerStatus, timestamp: Date)
}

extension Array where Element == HistoricalData {
    static func any(
        customizedData: [HistoricalData.CustomizedData]
    ) -> Self {
        customizedData.map { input in
                .init(
                    buildingActivePower: .any,
                    gridActivePower: .any,
                    pvActivePower: .any,
                    quasarsActivePowerStatus: input.quasarsStatus,
                    timestamp: input.timestamp
                )
        }
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

extension QuasarsEnergyResume: AnyCreatable {
    public static var any: Self {
        .init(consumedEnergy: .any,
              suppliedEnergy: .any,
              suppliedEnergyPercentage: .any,
              consumedEnergyPercentage: .any)
    }
}
