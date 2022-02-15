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
        lhs.dataSets == rhs.dataSets &&
        lhs.legendEntries == rhs.legendEntries
    }
}

extension LineChartDataSet {
    // Override the default implementation since is comparing the memory address of the instances.
    public final override func isEqual(_ object: Any?) -> Bool {
        guard let rhs = object as? Self else {
            return false
        }
        let lhs = self
        return lhs.entries == rhs.entries &&
            lhs.lineWidth == rhs.lineWidth &&
            lhs.axisDependency == rhs.axisDependency &&
            lhs.drawCircleHoleEnabled == rhs.drawCircleHoleEnabled &&
            lhs.drawCirclesEnabled == rhs.drawCirclesEnabled
    }
}

extension LegendEntry {
    // Override the default implementation since is comparing the memory address of the instances.
    public final override func isEqual(_ object: Any?) -> Bool {
        guard let rhs = object as? Self else {
            return false
        }
        let lhs = self
        return lhs.label == rhs.label &&
        lhs.form == rhs.form &&
        lhs.formLineDashPhase == rhs.formLineDashPhase &&
        lhs.formLineDashLengths == rhs.formLineDashLengths &&
        lhs.formColor == rhs.formColor
    }
}
