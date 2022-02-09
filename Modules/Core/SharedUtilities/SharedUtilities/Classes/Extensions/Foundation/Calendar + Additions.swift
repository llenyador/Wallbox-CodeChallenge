//
//  Calendar + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 30/08/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public extension Calendar {
    static var gregorian: Calendar {
        Calendar(identifier: .gregorian)
    }

    static let utc: Calendar = {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = .utc
        return cal
    }()
}
