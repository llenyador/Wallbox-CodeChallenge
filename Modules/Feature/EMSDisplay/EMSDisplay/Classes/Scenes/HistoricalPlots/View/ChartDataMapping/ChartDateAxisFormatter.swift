//
//  ChartDateAxisFormatter.swift
//  AppHost-EMSDisplay-Unit-Tests
//
//  Created by Aitor Salvador on 14/2/22.
//

import Charts

final class ChartDateAxisFormatter: IAxisValueFormatter {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    private let timestampsDict: [Double: Date]

    init(timestampsDict: [Double: Date]) {
        self.timestampsDict = timestampsDict
    }

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        guard let date = timestampsDict.value(forKey: value) else {
            assertionFailure("Date for vale \(value) was not mapped.")
            return value.description
        }
        return Self.dateFormatter.string(from: date)
    }
}
