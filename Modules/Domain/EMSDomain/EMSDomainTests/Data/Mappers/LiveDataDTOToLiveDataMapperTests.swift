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
        var quasarStatus: QuasarPowerStatus
        if input.quasarsPower >= 0 {
            quasarStatus = .consumingEnergy(abs(input.quasarsPower))
        } else {
            quasarStatus = .providingEnergy(abs(input.quasarsPower))
        }
        let expectedOutput = LiveData(
            solarPower: input.solarPower,
            quasarsPowerStatus: quasarStatus,
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
