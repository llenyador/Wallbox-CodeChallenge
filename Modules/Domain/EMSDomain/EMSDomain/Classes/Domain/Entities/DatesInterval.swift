//
//  DatesInterval.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 16/2/22.
//

struct DatesInterval {
    var startingDate: Date = .distantFuture
    var endingDate: Date = .distantPast

    var intervalInHours: CustomMeasurement<Hour> {
        let distanceBetweenDates = endingDate.timeIntervalSince(startingDate)
        return .init(distanceBetweenDates / Constants.secondsInAnHour)
    }

    mutating func add(newDate: Date) {
        if newDate < startingDate {
            startingDate = newDate
        }
        if endingDate < newDate {
            endingDate = newDate
        }
    }
}

// MARK: - Constants
private extension DatesInterval {
    enum Constants {
        static let secondsInAnHour: TimeInterval = 3600
    }
}
