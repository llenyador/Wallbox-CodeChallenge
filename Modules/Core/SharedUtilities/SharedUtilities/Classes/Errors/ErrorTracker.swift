//
//  ErrorTracker.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 04/03/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public protocol ErrorTrackerInterface {
    func track(fatalError: String, file: StaticString, line: UInt)
}

public extension ErrorTrackerInterface {
    func track(fatalError: String, file: StaticString = #file, line: UInt = #line) {
        track(fatalError: fatalError, file: file, line: line)
    }
}

struct ErrorTracker {
    private static var _tracker: ErrorTrackerInterface?
    static var tracker: ErrorTrackerInterface {
        get {
            guard let tracker = _tracker else {
                fatalError("Tracker not initialized")
            }
            return tracker
        }
        
        set {
            guard _tracker.isNil else {
                fatalError("Tracker already initialized")
            }
            _tracker = newValue
        }
    }
}
