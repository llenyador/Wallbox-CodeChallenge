//
//  EnergyConversionTests.swift
//  EMSDomain-Unit-EMSDomainTests
//
//  Created by Aitor Salvador on 13/2/22.
//

import XCTest
@testable import EMSDomain

final class EnergyConversionTests: XCTestCase {
    func testKWtoKWH() {
        let kw = Double.any
        let kWH = kw
        let expectedKWh = CustomMeasurement<KiloWattHour>(kWH * 0.5)
        let powerInput = CustomMeasurement<KiloWatt>(kw)
        let timeInput = CustomMeasurement<Hour>(0.5)
        let output = EnergyConversion.convertToKWh(powerInput, inPeriod: timeInput)
        XCTAssertEqual(output, expectedKWh)
    }
}
