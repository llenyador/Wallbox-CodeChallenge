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
        let input = DashboardModels.Data(
            quasarsEnergyResume: .any,
            liveData: .any(quasarStatus: .consumingEnergy)
        )
        let expectedOutput = DashboardModels.ViewModel.expectedResult(from: input)
        try testMapper(
            DashboardViewModelMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }

    func testQuasarStatusSupplyingEnergy() throws {
        let quasarsEnergySource = DashboardModels.EnergySource.any
        let input = DashboardModels.Data(
            quasarsEnergyResume: .any,
            liveData: .any(quasarStatus: .supplyingEnergy(quasarsEnergySource))
        )
        let expectedOutput = DashboardModels.ViewModel.quasarStatusSupplyingEnergy(
            from: input,
            quasarEnergySource: quasarsEnergySource
        )
        try testMapper(
            DashboardViewModelMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }
}

private extension DashboardModels.ViewModel {
    static func expectedResult(from data: DashboardModels.Data) -> Self {
        .init(
            gaugeInfo: .guageInfoVMs(for: data),
            liveSessionVM: .init(
                titleText: "dashboard_live_session_title".localized,
                sourcePower1VM: .solarPower(data.liveData.solarPower),
                sourcePower2VM: nil,
                sourcePower3VM: .gridPower(data.liveData.gridPower),
                totalPowerVM: .buildingDemandPower(data.liveData.buildingDemandPower)
            ),
            liveStatsVM: .init(
                titleText: "dashboard_live_sstats_title".localized,
                state: .displayGauges(
                    gaugeVMs: [
                        .solarPower(data.liveData.solarPower),
                        .gridPower(data.liveData.gridPower)
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
                gaugeInfo: .guageInfoVMs(for: data),
                liveSessionVM: .init(
                    titleText: "dashboard_live_session_title".localized,
                    sourcePower1VM: .solarPower(data.liveData.solarPower),
                    sourcePower2VM: .quasarSupplyingEnergy(quasarEnergySource),
                    sourcePower3VM: .gridPower(data.liveData.gridPower),
                    totalPowerVM: .buildingDemandPower(data.liveData.buildingDemandPower)
                ),
                liveStatsVM: .init(
                    titleText: "dashboard_live_sstats_title".localized,
                    state: .displayGauges(
                        gaugeVMs: [
                            .solarPower(data.liveData.solarPower),
                            .quasarSupplyingEnergy(quasarEnergySource),
                            .gridPower(data.liveData.gridPower)
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

private extension Array where Element == GaugeInfoViewViewModel {
    static func guageInfoVMs(for data: DashboardModels.Data) -> Self {
        [
            .init(infoText: "dashboard_quasars_supplying".localized,
                  value: normalizePercentageTo1(
                    data.quasarsEnergyResume.suppliedEnergyPercentage
                  ),
                  valueText: measurementToText(data.quasarsEnergyResume.suppliedEnergy),
                  style: .primary),
            .init(infoText: "dashboard_quasars_consuming".localized,
                  value: normalizePercentageTo1(
                    data.quasarsEnergyResume.consumedEnergyPercentage
                  ),
                  valueText: measurementToText(data.quasarsEnergyResume.consumedEnergy),
                  style: .red)
        ]
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
