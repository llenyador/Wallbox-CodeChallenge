//
//  Double + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 28/04/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public typealias Degrees = Double

public extension Degrees {
    var to360: Degrees {
        (self + 360).truncatingRemainder(dividingBy: 360)
    }

    var toMinutes: Double {
        self / 60
    }
}
