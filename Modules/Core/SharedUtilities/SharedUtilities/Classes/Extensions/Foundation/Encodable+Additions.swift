//
//  Encodable+Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 3/1/22.
//

private let encoder = JSONEncoder()

public extension Encodable {
    func toJSONData() throws -> Data {
        try encoder.encode(self)
    }
}
