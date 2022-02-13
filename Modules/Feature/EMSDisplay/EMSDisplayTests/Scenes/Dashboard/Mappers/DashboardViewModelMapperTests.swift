//
//  DashboardViewModelMapperTests.swift
//  EMSDisplay-Unit-EMSDisplayTests
//
//  Created by Aitor Salvador on 13/2/22.
//

import XCTest
import SwiftyMocky
import Combine
@testable import CoreLayout
@testable import SharedTestingUtilities
@testable import EMSDomain
@testable import EMSDomainMocks
@testable import EMSDisplay

final class DashboardViewModelMapperTests: XCTestCase {
    func testQuasarStatusConsumingEnergy() throws {
        let input = DashboardModels.Data.any(quasarStatus: .consumingEnergy(.any))
        let expectedOutput = DashboardModels.ViewModel.quasarStatusConsumingEnergy(from: input)
        try testMapper(
            DashboardViewModelMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }

    func testQuasarStatusSupplyingEnergy() throws {
        let quasarEnergySource: DashboardModels.EnergySource = .any
        let input = DashboardModels.Data.any(quasarStatus: .supplyingEnergy(quasarEnergySource))
        let expectedOutput = DashboardModels.ViewModel.quasarStatusSupplyingEnergy(
            from: input,
            quasarEnergySource: quasarEnergySource
        )
        try testMapper(
            DashboardViewModelMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }
}

private extension DashboardModels.ViewModel {
    static func quasarStatusConsumingEnergy(from data: DashboardModels.Data) -> Self {
        .init(
            gaugeInfo: [
                .init(infoText: "dashboard_quasars_consuming".localized,
                      value: 1,
                      valueText: measurementToText(data.quasarStatus.energy),
                      style: .red)
            ],
            liveSessionVM: .init(
                titleText: "dashboard_live_session_title".localized,
                sourcePower1VM: .solarPower(data.solarPower),
                sourcePower2VM: nil,
                sourcePower3VM: .gridPower(data.gridPower),
                totalPowerVM: .buildingDemandPower(data.buildingDemandPower)
            ),
            liveStatsVM: .init(
                titleText: "dashboard_live_sstats_title".localized,
                state: .displayGauges(
                    gaugeVMs: [
                        .solarPower(data.solarPower),
                        .gridPower(data.gridPower)
                    ]
                )
            )
        )
    }

    static func quasarStatusSupplyingEnergy(
        from data: DashboardModels.Data,
        quasarEnergySource: DashboardModels.EnergySource
    ) -> Self {
        .init(
            gaugeInfo: [
                .init(infoText: "dashboard_quasars_supplying".localized,
                      value: 1,
                      valueText: measurementToText(quasarEnergySource.energy),
                      style: .primary)
            ],
            liveSessionVM: .init(
                titleText: "dashboard_live_session_title".localized,
                sourcePower1VM: .solarPower(data.solarPower),
                sourcePower2VM: .quasarSupplyingEnergy(quasarEnergySource),
                sourcePower3VM: .gridPower(data.gridPower),
                totalPowerVM: .buildingDemandPower(data.buildingDemandPower)
            ),
            liveStatsVM: .init(
                titleText: "dashboard_live_sstats_title".localized,
                state: .displayGauges(
                    gaugeVMs: [
                        .solarPower(data.solarPower),
                        .quasarSupplyingEnergy(quasarEnergySource),
                        .gridPower(data.gridPower)
                    ]
                )
            )
        )
    }
}

private extension VerticalLabelsStackViewModel {
    static func solarPower(_ data: DashboardModels.EnergySource) -> Self {
        .init(
            topText: "dashboard_solar_power".localized,
            bottomText: measurementToText(data.power)
        )
    }

    static func gridPower(_ data: DashboardModels.EnergySource) -> Self {
        .init(
            topText: "dashboard_grid_power".localized,
            bottomText: measurementToText(data.power)
        )
    }

    static func quasarSupplyingEnergy(_ data: DashboardModels.EnergySource) -> Self {
        .init(
            topText: "dashboard_quasar_power".localized,
            bottomText: measurementToText(data.power)
        )
    }

    static func buildingDemandPower(_ data: CustomMeasurement<KiloWatt>) -> Self {
        .init(
            topText: "dashboard_building_demand".localized,
            bottomText: measurementToText(data)
        )
    }
}

private extension GaugeInfoViewViewModel {
    static func gridPower(_ data: DashboardModels.EnergySource) -> Self {
        .init(
            infoText: "dashboard_grid_power".localized,
            value: normalizePercentageTo1(data.suppliedPercentage),
            valueText: percentageToText(data.suppliedPercentage),
            style: .white
        )
    }

    static func solarPower(_ data: DashboardModels.EnergySource) -> Self {
        .init(
            infoText: "dashboard_solar_power".localized,
            value: normalizePercentageTo1(data.suppliedPercentage),
            valueText: percentageToText(data.suppliedPercentage),
            style: .white
        )
    }

    static func quasarSupplyingEnergy(_ data: DashboardModels.EnergySource) -> Self {
        .init(
            infoText: "dashboard_quasar_power".localized,
            value: normalizePercentageTo1(data.suppliedPercentage),
            valueText: percentageToText(data.suppliedPercentage),
            style: .white
        )
    }
}

private extension DashboardModels.QuasarStatus {
    var energy: CustomMeasurement<KiloWattHour> {
        switch self {
        case let .supplyingEnergy(energySource):
            return energySource.energy
        case let .consumingEnergy(energy):
            return energy
        }
    }
}


private func normalizePercentageTo1(_ value: Double) -> Double {
    value / 100
}

private func measurementToText<Unit>(
    _ measurement: CustomMeasurement<Unit>
) -> String {
    "\(measurement.value.round(toDecimals: 2)) \(Unit.symbol)"
}

private func percentageToText(_ value: Double) -> String {
    "\(value)%"
}
