//
//  AnyCreatable.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 2/1/22.
//

import Foundation

public protocol AnyCreatable {
    static var any: Self { get }
}

public extension Array where Element: AnyCreatable {
    static func any(length: Int = 1) -> Self {
        [Int](0...length).map { _ in
            Element.any
        }
    }
}
