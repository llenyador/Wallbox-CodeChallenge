//
//  Date + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 28/06/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public extension Date {
    func nextDay() -> Date? {
        Calendar.gregorian.date(byAdding: .day, value: 1, to: self)
    }
    
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    /// Returns the day at midnight.
    var midnight: Date {
        Calendar.gregorian.startOfDay(for: self)
    }
    
    func dateSubstracting(component: Calendar.Component, value: Int) -> Date? {
        Calendar.gregorian.date(byAdding: component, value: -value, to: self)
    }
    
    static let julianDay1January1970: Double = 2440587.5
    
    func toJulianDate() -> Double {
        Self.julianDay1January1970 + timeIntervalSince1970 / 86400
    }
    
    var midnightJulianDay: Double {
        (toJulianDate() - 0.5).rounded(.down) + 0.5
    }
    
    static func dateFromJulianDate(julianDate : Double) -> Date {
        let ts = (julianDate - Self.julianDay1January1970) * 86400
        return Date(timeIntervalSince1970: ts)
    }

    func settingCurrentYearAndZeroTime() -> Date? {
        let calendar = Calendar.utc
        let currentYear = calendar.component(.year, from: Date())

        var components = calendar.dateComponents([.day, .month, .year], from: self)
        components.year = currentYear
        components.hour = 0
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)
    }
}
