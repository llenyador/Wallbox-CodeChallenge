//
//  Util Functions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 12/07/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public func printDebug(_ closure: @autoclosure () -> Any) {
    #if DEBUG
    let text = "[DEBUG] - \(closure())"
    print(text)
    #endif
}
