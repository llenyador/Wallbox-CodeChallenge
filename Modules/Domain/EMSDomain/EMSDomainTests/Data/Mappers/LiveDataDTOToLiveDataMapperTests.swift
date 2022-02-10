//
//  LiveDataDTOToLiveDataMapperTests.swift
//  EMSDomain-Unit-EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SharedTestingUtilities
@testable import EMSDomain

final class LiveDataDTOToLiveDataMapperTests: XCTestCase {
    func test() throws {
        let input = LiveDataDTO.any
        let expectedOutput = LiveData(
            solarPower: input.solarPower,
            quasarsPower: input.quasarsPower,
            gridPower: input.gridPower,
            buildingDemand: input.buildingDemand,
            systemSoc: input.systemSoc,
            totalEnergy: input.totalEnergy,
            currentEnergy: input.currentEnergy
        )
        try testMapper(
            LiveDataDTOToLiveDataMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }
}
