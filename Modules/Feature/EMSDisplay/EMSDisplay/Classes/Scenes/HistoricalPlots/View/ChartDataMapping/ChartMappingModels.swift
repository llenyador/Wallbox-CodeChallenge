//
//  ChartMappingModels.swift
//  AppHost-EMSDisplay-Unit-Tests
//
//  Created by Aitor Salvador on 14/2/22.
//

import Charts
import SharedUtilities

enum ChartMappingModels {
    enum PowerSource: CaseIterable, Hashable {
        case solarPower
        case buildingDemandPower
        case gridPower
        case quasarsPower

        var color: UIColor {
            switch self {
            case .solarPower:
                return .green
            case .buildingDemandPower:
                return .yellow
            case .gridPower:
                return .red
            case .quasarsPower:
                return .blue
            }
        }

        var legendTitle: String {
            switch self {
            case .solarPower:
                return "historical_plots_legend_solar_power".localized
            case .buildingDemandPower:
                return "historical_plots_legend_building_demand_power".localized
            case .gridPower:
                return "historical_plots_legend_grid_power".localized
            case .quasarsPower:
                return "historical_plots_legend_quasars_power".localized
            }
        }

        var legend: LegendEntry {
            .init(
                label: legendTitle,
                form: Legend.Form.square,
                formSize: .nan,
                formLineWidth: .nan,
                formLineDashPhase: 0,
                formLineDashLengths: nil,
                formColor: color
            )
        }

        static var legendEntries: [LegendEntry] {
            allCases.map {
                $0.legend
            }
        }
    }
}
