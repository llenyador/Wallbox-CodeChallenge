//
//  TestError.swift
//  Pods
//
//  Created by Aitor Salvador García on 23/07/2020.
//

import Foundation

public enum TestError: Error, Equatable, CaseIterable {
    case error1
    case error2

    static var any: TestError {
        allCases.randomElement() ?? .error1
    }
}
