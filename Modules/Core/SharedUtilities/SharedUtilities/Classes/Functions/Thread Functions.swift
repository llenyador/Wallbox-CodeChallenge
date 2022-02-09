//
//  Thread Functions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 30/12/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Foundation

public func delay(_ delay: Double, closure: @escaping () -> Void) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

public typealias Debounce<T> = (_ : T) -> Void

public func debounce<T>(interval: Int,
                        queue: DispatchQueue,
                        action: @escaping Debounce<T>) -> Debounce<T> {
    var lastFireTime = DispatchTime.now()
    let dispatchDelay = DispatchTimeInterval.milliseconds(interval)

    return { param in
        lastFireTime = DispatchTime.now()
        let dispatchTime: DispatchTime = DispatchTime.now() + dispatchDelay

        queue.asyncAfter(deadline: dispatchTime) {
            let when: DispatchTime = lastFireTime + dispatchDelay
            let now = DispatchTime.now()

            if now.rawValue >= when.rawValue {
                action(param)
            }
        }
    }
}
