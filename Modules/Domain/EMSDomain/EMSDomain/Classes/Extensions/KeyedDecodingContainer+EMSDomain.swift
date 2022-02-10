//
//  KeyedDecodingContainer+EMSDomain.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

extension KeyedDecodingContainer {
    func decode<V>(
        _ measurementType: Measurement<V>.Type,
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> Measurement<V> {
        let doubleValue = try decode(Double.self, forKey: key)
        return .init(doubleValue)
    }

    func decode<V>(
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> Measurement<V> {
        try decode(Measurement<V>.self, forKey: key)
    }

    func decodeDate(
        _ dateFormatter: DateFormatter,
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> Date {
        let dateString = try decode(String.self, forKey: key)
        guard let date = dateFormatter.date(from: dateString) else {
            throw CustomError.mapping
        }
        return date
    }
}
