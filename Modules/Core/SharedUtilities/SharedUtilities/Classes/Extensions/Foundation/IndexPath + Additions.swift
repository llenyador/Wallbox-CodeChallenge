//
//  IndexPath.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 30/12/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Foundation

#if !os(macOS)

public extension IndexPath {
    static var zero: IndexPath {
        .init(row: 0, section: 0)
    }
    
    static func row(_ row: Int) -> IndexPath {
        .init(row: row, section: 0)
    }
    
    static func section(_ section: Int) -> IndexPath {
        .init(row: 0, section: section)
    }
}

#endif
