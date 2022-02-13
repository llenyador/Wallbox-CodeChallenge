//
//  Matcher+TestingUtilities.swift
//  AppHost-EMSDisplay-Unit-Tests
//
//  Created by Aitor Salvador on 13/2/22.
//

import SwiftyMocky

public extension Matcher {
    public static func registerDefaultComparators() {
        self.default.register(Error.self) { lhs, rhs in
            guard let lhs = lhs as? TestError,
                  let rhs = rhs as? TestError else {
                      return false
                  }
            return lhs == rhs
        }
    }
}
