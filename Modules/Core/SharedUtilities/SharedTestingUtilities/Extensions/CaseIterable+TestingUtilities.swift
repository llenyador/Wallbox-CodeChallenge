//
//  CaseIterable+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 2/1/22.
//

import Foundation

public extension CaseIterable {
    static var any: Self {
        guard let random = allCases.randomElement() else {
            fatalError("did not find a random element for \(self)")
        }
        return random
    }
}

public extension CaseIterable where Self: Hashable {
    static func any(excepting: Set<Self>) -> Self {
        let allCasesWithoutExcepting = allCases.filter {
            !excepting.contains($0)
        }
        guard let random = allCasesWithoutExcepting.randomElement() else {
            fatalError("did not find a random element for \(self)")
        }
        return random
    }
}
