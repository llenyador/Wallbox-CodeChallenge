//
//  safeFatalError.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 01/08/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

public func safeFatalError(_ message: String,
                           file: StaticString = #file,
                           line: UInt = #line,
                           debugFatalError: @autoclosure () -> Bool = true) {
    #if DEBUG
    if debugFatalError() {
        fatalError(message, file: file, line: line)
    } else {
        print("[DEBUG] - ⚠️ - \(message)")
    }
    #else
    ErrorTracker.tracker.track(fatalError: message,
                               file: file,
                               line: line)
    #endif
}
