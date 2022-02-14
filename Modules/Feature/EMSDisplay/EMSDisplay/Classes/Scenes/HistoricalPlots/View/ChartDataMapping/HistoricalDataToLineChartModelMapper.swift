//
//  HistoricalDataToLineChartModelMapper.swift
//  AppHost_EMSDisplay_Unit_Tests
//
//  Created by Aitor Salvador on 13/2/22.
//

import Charts
import CoreLayout
import EMSDomain
import SharedUtilities
import UIKit

enum HistoricalDataToLineChartModelMapper: MapperProtocol {
    private typealias DataSetDictionary = [ChartMappingModels.PowerSource: LineChartDataSet]

    static func map(_ input: [HistoricalData]) throws -> LineChartModel {
        var indexCounter: Int = 0
        var timestampsDict: [Double: Date] = [:]
        var dataSetDictionary: DataSetDictionary = [:]

        
        input.forEach { data in
            appendEntries(toDict: &dataSetDictionary,
                          fromData: data,
                          indexCounter: indexCounter)
            timestampsDict.updateValue(data.timestamp,
                                       forKey: indexCounter.doubleValue)
            indexCounter += 1
        }

        return .init(
            dataSets: Array(dataSetDictionary.values),
            legendEntries: ChartMappingModels.PowerSource.legendEntries,
            formatter: ChartDateAxisFormatter(timestampsDict: timestampsDict)
        )
    }
}

// MARK: - Private methods
private extension HistoricalDataToLineChartModelMapper {
    private static func appendEntries(
        toDict dataSetDictionary: inout DataSetDictionary,
        fromData data: HistoricalData,
        indexCounter: Int
    ) {
        ChartMappingModels.PowerSource.allCases.forEach { source in
            var power: Double
            switch source {
            case .solarPower:
                power = data.pvActivePower.value
            case .buildingDemandPower:
                power = data.buildingActivePower.value
            case .gridPower:
                power = data.gridActivePower.value
            case .quasarsPower:
                switch data.quasarsActivePowerStatus {
                case let .supplyingEnergy(powerMeasurement):
                    power = powerMeasurement.value
                case let .consumingEnergy(powerMeasurement):
                    power = -powerMeasurement.value
                }
            }

            dataSetDictionary.appendEntry(
                .init(x: indexCounter.doubleValue,
                      y: power),
                forKey: source
            )
        }
    }
}

// MARK: - Dictionary Helpers
private extension Dictionary {
    /// Creates the line chart data set if not exists.
    /// If exists, it reuses the existing set and appends the new entry.
    mutating func appendEntry(
        _ value: ChartDataEntry,
        forKey key: Key
    ) where Key == ChartMappingModels.PowerSource,
                Value == LineChartDataSet {
        if let existingSet = self.value(forKey: key) {
            existingSet.append(value)
        } else {
            // Initialize data set if not exists.
            let newSet = LineChartDataSet(entries: [value])
            newSet.setColor(key.color)
            newSet.lineWidth = 1
            newSet.axisDependency = .left
            newSet.drawCircleHoleEnabled = false
            newSet.drawCirclesEnabled = false
            updateValue(newSet, forKey: key)
        }
    }
}
