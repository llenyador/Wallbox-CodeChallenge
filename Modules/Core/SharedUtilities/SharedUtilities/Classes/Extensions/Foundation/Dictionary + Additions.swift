//
//  Dictionary + Additions.swift
//  Template
//
//  Created by Aitor Salvador on 14/10/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Foundation

public extension Dictionary {
    func value(forKey key: Key) -> Value? {
        self[key]
    }
}

public extension Dictionary where Value: Comparable {
    func value(forKey key: Key, greaterOrEqualTo checkedValue: Value) -> Value? {
        guard let value = value(forKey: key), value >= checkedValue else {
            return nil
        }
        return value
    }
}
