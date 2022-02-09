//
//  String + Additions.swift
//  Template
//
//  Created by Aitor Salvador on 14/10/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Foundation

public extension String {
    var intValue: Int? {
        Int(self)
    }
    
    var doubleValue: Double? {
        Double(self)
    }

    func asURL() -> URL? {
        URL(string: self)
    }

    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    func localized(with arguments: CVarArg...) -> String {
        String(format: self.localized, arguments: arguments)
    }
    
    func date(from dateFormatter: DateFormatter) -> Date? {
        dateFormatter.date(from: self)
    }
}
