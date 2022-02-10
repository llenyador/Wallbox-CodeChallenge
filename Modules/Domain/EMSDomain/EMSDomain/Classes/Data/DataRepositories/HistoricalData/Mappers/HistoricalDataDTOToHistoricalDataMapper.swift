//
//  HistoricalDataDTOToHistoricalDataMapper.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

enum HistoricalDataDTOToHistoricalDataMapper: MapperProtocol {
    static func map(_ input: HistoricalDataDTO) throws -> HistoricalData {
        .init(
            buildingActivePower: input.buildingActivePower,
            gridActivePower: input.gridActivePower,
            pvActivePower: input.pvActivePower,
            quasarsActivePower: input.quasarsActivePower,
            timestamp: input.timestamp
        )
    }
}
