//
//  DateFormatters.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 26/07/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public let localeFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = .current
    dateFormatter.timeZone = .current
    return dateFormatter
}()

public let HHmmDateFormatter: DateFormatter = {
    let dateFormatter = localeFormatter.copy() as! DateFormatter
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter
}()

public let appStoreDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
    return dateFormatter
}()

public let shortDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd"
    formatter.timeZone = .utc
    return formatter
}()
