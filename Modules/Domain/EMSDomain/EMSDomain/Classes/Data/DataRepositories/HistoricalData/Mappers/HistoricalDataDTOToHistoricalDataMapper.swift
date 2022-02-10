//
//  HistoricalDataDTOToHistoricalDataMapper.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

enum HistoricalDataDTOToHistoricalDataMapper: MapperProtocol {
    static func map(_ input: HistoricalDataDTO) throws -> HistoricalData {
        throw CustomError.mapping
    }
}
