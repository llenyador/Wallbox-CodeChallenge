//
//  HistoricalDataDTOToHistoricalDataMapperTests.swift
//  EMSDomain-Unit-EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SharedTestingUtilities
@testable import EMSDomain

final class HistoricalDataDTOToHistoricalDataMapperTests: XCTestCase {
    func test() throws {
        let input = HistoricalDataDTO.any
        let expectedOutput = HistoricalData(
            buildingActivePower: input.buildingActivePower,
            gridActivePower: input.gridActivePower,
            pvActivePower: input.pvActivePower,
            quasarsActivePower: input.quasarsActivePower,
            timestamp: input.timestamp
        )
        try testMapper(
            HistoricalDataDTOToHistoricalDataMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }
}
