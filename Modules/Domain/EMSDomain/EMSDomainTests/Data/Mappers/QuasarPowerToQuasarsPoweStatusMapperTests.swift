//
//  QuasarPowerToQuasarsPoweStatusMapperTests.swift
//  EMSDisplay-Unit-EMSDisplayTests
//
//  Created by Aitor Salvador on 15/2/22.
//

import XCTest

import XCTest
import SharedTestingUtilities
@testable import EMSDomain

final class QuasarPowerToQuasarsPoweStatusMapperTests: XCTestCase {
    func testConsumingEnergy() throws {
        let kw = CustomMeasurement<KiloWatt>(10)
        let input = kw
        let expectedOutput = QuasarPowerStatus.consumingEnergy(kw)
        try testMapper(
            QuasarPowerToQuasarsPoweStatusMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }

    func testSupplyingEnergy() throws {
        let kw = CustomMeasurement<KiloWatt>(-10)
        let input = kw
        let expectedOutput = QuasarPowerStatus.supplyingEnergy(abs(kw))
        try testMapper(
            QuasarPowerToQuasarsPoweStatusMapper.self,
            withInput: input,
            producesOutput: expectedOutput
        )
    }
}
