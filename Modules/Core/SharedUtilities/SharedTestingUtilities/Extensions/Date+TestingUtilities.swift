//
//  Date+TestingUtilities.swift
//  EMSDisplay-Unit-EMSDisplayUITests
//
//  Created by Aitor Salvador on 16/2/22.
//

import Foundation

private let halfHourInSeconds: TimeInterval = 3600 / 2

public func advancingHalfAnHour(_ date: inout Date) -> Date {
    let newDate = date.advanced(by: halfHourInSeconds)
    date = newDate
    return newDate
}
