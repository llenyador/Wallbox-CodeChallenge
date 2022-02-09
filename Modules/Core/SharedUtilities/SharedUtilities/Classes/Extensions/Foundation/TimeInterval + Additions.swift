//
//  TimeInterval + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 12/07/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

private let secondsToMinutes = 60

public extension TimeInterval {
    static func minutes(_ minutes: Int) -> TimeInterval {
        (minutes * secondsToMinutes).doubleValue
    }
}
