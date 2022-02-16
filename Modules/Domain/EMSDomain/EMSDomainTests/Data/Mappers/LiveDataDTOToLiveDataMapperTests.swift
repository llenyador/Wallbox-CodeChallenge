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
            quasarsPowerStatus: try QuasarPowerToQuasarsPoweStatusMapper.map(input.quasarsPower),
            gridPower: input.gridPower,
            buildingDemandPower: input.buildingDemand,
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
