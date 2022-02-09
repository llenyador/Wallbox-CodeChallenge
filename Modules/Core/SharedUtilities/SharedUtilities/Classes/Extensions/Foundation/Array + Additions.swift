//
//  Array + Additions.swift
//  Wallapop-Tech-Test
//
//  Created by Aitor Salvador on 15/10/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Foundation

public extension Array {
    var hasElements: Bool {
        !isEmpty
    }
    
    func isValid(index: Int) -> Bool {
        index < count && index >= 0
    }
    
    func value(at index: Int) -> Element? {
        guard isValid(index: index) else {
            return nil
        }
        return self[index]
    }
    
    func penultimate() -> Element? {
        value(at: count - 2)
    }

    func splitInTwo(leftSideLenght: Int) -> (left: [Element], right: [Element]) {
        guard count >= leftSideLenght else {
            return (
                left: Array(prefix(leftSideLenght)),
                right: []
            )
        }

        let leftSplit = self[0 ..< leftSideLenght]
        let rightSplit = self[leftSideLenght ..< count]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}

public extension Array where Element: Hashable {
    var elementIndexDict: [Element: Int] {
        var dict: [Element: Int] = [:]
        for (index, element) in enumerated() {
            dict[element] = index
        }
        return dict
    }
    
    var indexElementDict: [Int: Element] {
        var dict: [Int: Element] = [:]
        for (index, element) in enumerated() {
            dict[index] = element
        }
        return dict
    }

    var uniqueValues: [Element] {
        Array(Set(self))
    }
}
