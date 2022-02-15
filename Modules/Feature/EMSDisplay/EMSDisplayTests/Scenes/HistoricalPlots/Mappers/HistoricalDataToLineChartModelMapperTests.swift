//
//  HistoricalDataToLineChartModelMapperTests.swift
//  EMSDisplay-Unit-EMSDisplayTests
//
//  Created by Aitor Salvador on 15/2/22.
//

import XCTest
import SharedTestingUtilities
@testable import CoreLayout
@testable import EMSDisplay
@testable import EMSDomain
@testable import EMSDomainMocks
import Charts

final class HistoricalDataToLineChartModelMapperTests: XCTestCase {
    func test() throws {
        let data = HistoricalData.any
        let input = [data]

        var legendEntries: [LegendEntry] = []
        let sets = ChartMappingModels.PowerSupplyType.allCases
            .map { type -> LineChartDataSet in
                var power: Double
                switch type {
                case .quasarsPower:
                    switch data.quasarsActivePowerStatus {
                    case let .supplyingEnergy(powerMeasurement):
                        power = powerMeasurement.value
                    case let .consumingEnergy(powerMeasurement):
                        power = -powerMeasurement.value
                    }
                case .solarPower:
                    power = data.pvActivePower.value
                case .buildingDemandPower:
                    power = data.buildingActivePower.value
                case .gridPower:
                    power = data.gridActivePower.value
                }
                legendEntries.append(type.legend)
                let entry = ChartDataEntry(x: 0, y: power)
                let newSet = LineChartDataSet(entries: [entry])
                newSet.setColor(type.color)
                newSet.lineWidth = 1
                newSet.axisDependency = .left
                newSet.drawCircleHoleEnabled = false
                newSet.drawCirclesEnabled = false
                return newSet
            }

        let expectedOutput = LineChartModel(
            dataSets: sets,
            legendEntries: legendEntries,
            formatter: ChartDateAxisFormatter(timestampsDict: [:])
        )
        try testMapper(
            HistoricalDataToLineChartModelMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }
}
