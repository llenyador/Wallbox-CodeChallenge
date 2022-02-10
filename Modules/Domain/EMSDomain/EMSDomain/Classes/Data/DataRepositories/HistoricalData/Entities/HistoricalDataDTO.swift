//
//  HistoricalDataDTO.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

struct HistoricalDataDTO: Decodable {
    let buildingActivePower: CustomMeasurement<KiloWatt>
    let gridActivePower: CustomMeasurement<KiloWatt>
    let pvActivePower: CustomMeasurement<KiloWatt>
    let quasarsActivePower: CustomMeasurement<KiloWatt>
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
        timestamp = try container.decodeDate(Constants.dateFormatter,
                                             forKey: .timestamp)
    }
}

extension HistoricalDataDTO {
    init(buildingActivePower: CustomMeasurement<KiloWatt>,
         gridActivePower: CustomMeasurement<KiloWatt>,
         pvActivePower: CustomMeasurement<KiloWatt>,
         quasarsActivePower: CustomMeasurement<KiloWatt>,
         timestamp: Date) {
        self.buildingActivePower = buildingActivePower
        self.gridActivePower = gridActivePower
        self.pvActivePower = pvActivePower
        self.quasarsActivePower = quasarsActivePower
        self.timestamp = timestamp
    }
}

// MARK: - Constants
private extension HistoricalDataDTO {
    enum Constants {
        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // "2021-09-27T16:06:00+00:00"
            return formatter
        }()
    }
}
