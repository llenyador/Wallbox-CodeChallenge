//
//  DashboardViewModelMapper.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/2/22.
//

import CoreLayout
import EMSDomain
import SharedUtilities

enum DashboardViewModelMapper: MapperProtocol {
    static func map(_ input: DashboardModels.Data) throws -> DashboardModels.ViewModel {
        DashboardModels.ViewModel(
            gaugeInfo: mapQuasarsResumeToGaugeVMs(input.quasarsEnergyResume),
            liveSessionVM: mapToLiveSessionVM(input.liveData),
            liveStatsVM: mapToLiveStatsVM(input.liveData)
        )
    }
}

// MARK: - Private methods
private extension DashboardViewModelMapper {
    static func mapQuasarsResumeToGaugeVMs(
        _ quasarsData: QuasarsEnergyResume
    ) -> [GaugeInfoViewViewModel] {
        [
            .init(
                infoText: "dashboard_quasars_supplying".localized,
                value: normalizePercentageTo1(quasarsData.suppliedEnergyPercentage),
                valueText: mapMeasurementToText(quasarsData.suppliedEnergy),
                style: .primary
            ),
            .init(
                infoText: "dashboard_quasars_consuming".localized,
                value: normalizePercentageTo1(quasarsData.consumedEnergyPercentage),
                valueText: mapMeasurementToText(quasarsData.consumedEnergy),
                style: .red
            )
        ]
    }

    static func mapToLiveSessionVM(
        _ data: DashboardModels.LiveData
    ) -> LiveSessionViewViewModel {
        var optionalQuasarVM: VerticalLabelsStackViewModel?
        if case let .supplyingEnergy(energySource) = data.quasarStatus {
            optionalQuasarVM = .init(
                topText: "dashboard_quasar_power".localized,
                bottomText: mapMeasurementToText(energySource.power)
            )
        }
        return LiveSessionViewViewModel(
            titleText: "dashboard_live_session_title".localized,
            sourcePower1VM: .init(
                topText: "dashboard_solar_power".localized,
                bottomText: mapMeasurementToText(data.solarPower.power)
            ),
            sourcePower2VM: optionalQuasarVM,
            sourcePower3VM: .init(
                topText: "dashboard_grid_power".localized,
                bottomText: mapMeasurementToText(data.gridPower.power)
            ),
            totalPowerVM: .init(
                topText: "dashboard_building_demand".localized,
                bottomText: mapMeasurementToText(data.buildingDemandPower)
            )
        )
    }

    static func mapToLiveStatsVM(
        _ data: DashboardModels.LiveData
    ) -> LiveStatsViewViewModel {
        var gaugeVMs: [GaugeInfoViewViewModel] = []

        gaugeVMs.append(
            .init(
                infoText: "dashboard_solar_power".localized,
                value: normalizePercentageTo1(data.solarPower.suppliedPercentage),
                valueText: mapPercentageToText(data.solarPower.suppliedPercentage),
                style: .white
            )
        )
        if case let .supplyingEnergy(energySource) = data.quasarStatus {
            gaugeVMs.append(
                .init(
                    infoText: "dashboard_quasar_power".localized,
                    value: normalizePercentageTo1(energySource.suppliedPercentage),
                    valueText: mapPercentageToText(energySource.suppliedPercentage),
                    style: .white
                )
            )
        }
        gaugeVMs.append(
            .init(
                infoText: "dashboard_grid_power".localized,
                value: normalizePercentageTo1(data.gridPower.suppliedPercentage),
                valueText: mapPercentageToText(data.gridPower.suppliedPercentage),
                style: .white
            )
        )
        return LiveStatsViewViewModel(
            titleText: "dashboard_live_sstats_title".localized,
            state: .displayGauges(gaugeVMs: gaugeVMs)
        )
    }

    static func normalizePercentageTo1(_ value: Double) -> Double {
        value / Constants.normalizeTo1Divisor
    }

    static func mapMeasurementToText<Unit>(
        _ measurement: CustomMeasurement<Unit>
    ) -> String {
        "\(measurement.value.round(toDecimals: 2)) \(Unit.symbol)"
    }

    static func mapPercentageToText(_ value: Double) -> String {
        "\(value)%"
    }
}

// MARK: - Constants
private extension DashboardViewModelMapper {
    enum Constants {
        static let normalizeTo1Divisor: Double = 100
    }
}
