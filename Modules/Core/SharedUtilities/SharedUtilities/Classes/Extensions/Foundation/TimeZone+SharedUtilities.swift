//
//  TimeZone+SharedUtilities.swift
//  DataRepositories
//
//  Created by Aitor Salvador García on 4/10/21.
//

import Foundation

public extension TimeZone {
    static var utc: TimeZone {
        guard let utcTZ = TimeZone(identifier: "GMT") else {
            safeFatalError("could not build UTC Time Zone")
            return TimeZone.current
        }
        return utcTZ
    }
}
