//
//  MapperProtocol.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 03/10/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public protocol MapperProtocol {
    associatedtype Input
    associatedtype Output
    static func map(_ input: Input) throws -> Output
    static func map(_ inputList: [Input]) throws -> [Output]
}

public extension MapperProtocol {
    static func map(_ inputList: [Input]) throws -> [Output] {
        try inputList.map {
            try Self.map($0)
        }
    }
    
    static func safeMap(_ inputList: [Input]) -> [Output] {
        inputList.compactMap {
            try? Self.map($0)
        }
    }
}
