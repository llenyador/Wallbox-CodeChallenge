//
//  HistoricalDataDTO.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

private let kDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // "2021-09-27T16:06:00+00:00"
    return formatter
}()

struct HistoricalDataDTO: Decodable {
    let buildingActivePower: Measurement<KiloWatt>
    let gridActivePower: Measurement<KiloWatt>
    let pvActivePower: Measurement<KiloWatt>
    let quasarsActivePower: Measurement<KiloWatt>
    let timestamp: Date

    enum CodingKeys: String, CodingKey {
        case buildingActivePower = "building_active_power"
        case gridActivePower = "grid_active_power"
        case pvActivePower = "pv_active_power"
        case quasarsActivePower = "quasars_active_power"
        case timestamp = "timestamp"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        buildingActivePower = try container.decode(forKey: .buildingActivePower)
        gridActivePower = try container.decode(forKey: .gridActivePower)
        pvActivePower = try container.decode(forKey: .pvActivePower)
        quasarsActivePower = try container.decode(forKey: .quasarsActivePower)
        timestamp = try container.decodeDate(kDateFormatter, forKey: .timestamp)
    }
}
