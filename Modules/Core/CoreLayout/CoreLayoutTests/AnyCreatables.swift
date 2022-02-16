//
//  AnyCreatables.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 13/2/22.
//

import Charts
import CoreLayout
import SharedTestingUtilities

extension VerticalLabelsStackViewModel: AnyCreatable {
    public static var any: Self {
        .init(topText: .any,
              bottomText: .any)
    }
}

extension GaugeInfoViewViewModel.Style: CaseIterable {
    public static var allCases: [GaugeInfoViewViewModel.Style] {
        [
            .white,
            .primary,
            .red
        ]
    }
}

extension GaugeInfoViewViewModel: AnyCreatable {
    public static var any: Self {
        .init(
            infoText: .any,
            value: .any,
            valueText: .any,
            style: .any
        )
    }
}

extension LineChartModel: AnyCreatable {
    final class TestFormatter: IAxisValueFormatter {
        init() {}

        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            ""
        }
    }

    public static var any: Self {
        .init(
            dataSets: [.any],
            legendEntries: [.any],
            formatter: TestFormatter()
        )
    }
}

extension LineChartDataSet {
    public static var any: LineChartDataSet {
        LineChartDataSet(entries: [.any])
    }
}

extension ChartDataEntry {
    public static var any: ChartDataEntry {
        .init(x: .any, y: .any)
    }
}

extension LegendEntry {
    public static var any: LegendEntry {
        .init()
    }
}
