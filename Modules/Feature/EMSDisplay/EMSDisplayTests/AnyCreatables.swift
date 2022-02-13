//
//  AnyCreatables.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//

import SharedTestingUtilities
@testable import EMSDomain
@testable import EMSDomainMocks
@testable import CoreLayoutMocks
@testable import EMSDisplay

extension DashboardModels.Data: AnyCreatable {
    public static var any: Self {
        .init(
            quasarStatus: .any,
            solarPower: .any,
            gridPower: .any,
            buildingDemandPower: .any
        )
    }

    public static func any(quasarStatus: DashboardModels.QuasarStatus) -> Self {
        .init(
            quasarStatus: quasarStatus,
            solarPower: .any,
            gridPower: .any,
            buildingDemandPower: .any
        )
    }
}

extension DashboardModels.QuasarStatus: CaseIterable {
    public static var allCases: [Self] {
        [
            .consumingEnergy(.any),
            .supplyingEnergy(.any)
        ]
    }
}

extension DashboardModels.EnergySource: AnyCreatable {
    public static var any: Self {
        .init(power: .any,
              energy: .any,
              suppliedPercentage: .any)
    }
}

extension DashboardModels.ViewModel: AnyCreatable {
    public static var any: Self {
        .init(
            gaugeInfo: .any(length: 1),
            liveSessionVM: .any,
            liveStatsVM: .any
        )
    }
}


extension LiveStatsViewViewModel: AnyCreatable {
    public static var any: Self {
        .init(titleText: .any,
              state: .any)
    }
}

extension LiveStatsViewViewModel.State: CaseIterable {
    public static var allCases: [LiveStatsViewViewModel.State] {
        [
            .empty(message: .any),
            .displayGauges(gaugeVMs: .any(length: 3))
        ]
    }
}

extension LiveSessionViewViewModel: AnyCreatable {
    public static var any: Self {
        .init(
            titleText: .any,
            sourcePower1VM: .any,
            sourcePower2VM: .any,
            sourcePower3VM: .any,
            totalPowerVM: .any
        )
    }
}
