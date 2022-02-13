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
        let expectedKWh = CustomMeasurement<KiloWattHour>(kWH)
        let input = CustomMeasurement<KiloWatt>(kw)
        let output = EnergyConversion.convertToKWh(input)
        XCTAssertEqual(output, expectedKWh)
    }
}
