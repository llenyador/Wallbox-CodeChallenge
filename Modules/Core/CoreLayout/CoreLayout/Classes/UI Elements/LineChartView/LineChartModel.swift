//
//  LineChartModel.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 13/2/22.
//

import Foundation
import Charts

public struct LineChartModel {
    public let dataSets: [LineChartDataSet]
    public let legendEntries: [LegendEntry]
    public let formatter: IAxisValueFormatter

    public init(dataSets: [LineChartDataSet],
                legendEntries: [LegendEntry],
                formatter: IAxisValueFormatter) {
        self.dataSets = dataSets
        self.legendEntries = legendEntries
        self.formatter = formatter
    }
}

extension LineChartModel: Equatable {
    public static func == (lhs: LineChartModel, rhs: LineChartModel) -> Bool {
        lhs.dataSets == rhs.dataSets
    }
}
