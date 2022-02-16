//
//  GetQuasarsEnergyResumeUseCaseTests.swift
//  EMSDomain-Unit-EMSDomainTests
//
//  Created by Aitor Salvador on 16/2/22.
//

import XCTest
import SwiftyMocky
@testable import SharedTestingUtilities
@testable import EMSDomain

final class GetQuasarsEnergyResumeUseCaseTests: XCTestCase {
    private var useCase: GetQuasarsEnergyResumeUseCase!
    private var repositoryMock: HistoricalDataDataRepositoryProtocolMock!

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()
        repositoryMock = nil
        useCase = nil
    }

    func testSuccessOnlySuppliyingEnergy() throws {
        // Samples each half an hour
        let initialTime: Date = .distantPast
        var sampleTime: Date = initialTime
        let input: [HistoricalData] = .any(
            customizedData: [
                (.supplyingEnergy(10), sampleTime),
                (.supplyingEnergy(12), advancingHalfAnHour(&sampleTime)),
                (.supplyingEnergy(14), advancingHalfAnHour(&sampleTime)),
                (.supplyingEnergy(16), advancingHalfAnHour(&sampleTime)),
                (.supplyingEnergy(18), advancingHalfAnHour(&sampleTime))
            ]
        )
        let expectedOutput = QuasarsEnergyResume.allSupplied

        repositoryMock.given(.getHistoricalData(willReturn: .just(input)))

        let publisher = useCase.execute()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)

        repositoryMock.verifyOnce(.getHistoricalData())
    }

    func testSuccessSupplyingAndConsumingEnergy() throws {
        // Samples each half an hour
        let initialTime: Date = .distantPast
        var sampleTime: Date = initialTime
        let input: [HistoricalData] = .any(
            customizedData: [
                (.supplyingEnergy(10), sampleTime),
                (.supplyingEnergy(12), advancingHalfAnHour(&sampleTime)),
                (.supplyingEnergy(14), advancingHalfAnHour(&sampleTime)),
                (.supplyingEnergy(16), advancingHalfAnHour(&sampleTime)),
                (.supplyingEnergy(18), advancingHalfAnHour(&sampleTime)),
                (.consumingEnergy(4), advancingHalfAnHour(&sampleTime)),
                (.consumingEnergy(6), advancingHalfAnHour(&sampleTime)),
                (.consumingEnergy(8), advancingHalfAnHour(&sampleTime)),
                (.consumingEnergy(10), advancingHalfAnHour(&sampleTime)),
                (.consumingEnergy(12), advancingHalfAnHour(&sampleTime))
            ]
        )
        let expectedOutput = QuasarsEnergyResume.suppliedAndConsuming

        repositoryMock.given(.getHistoricalData(willReturn: .just(input)))

        let publisher = useCase.execute()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)

        repositoryMock.verifyOnce(.getHistoricalData())
    }

    func testFailure() throws {
        let expectedError = TestError.error1
        repositoryMock.given(.getHistoricalData(
            willReturn: .failure(error: expectedError)
        ))

        let publisher = useCase.execute()
        let optionalError = try waitForPublisherError(publisher)
        assertError(optionalError, isEqualToExpectedError: expectedError)

        repositoryMock.verifyOnce(.getHistoricalData())
    }
}

// MARK: Private methods
private extension GetQuasarsEnergyResumeUseCaseTests {
    func setupDependencies() {
        repositoryMock = .init()
        useCase = .init(dataRepository: repositoryMock)
    }
}

private extension QuasarsEnergyResume {
    
    static var allConsumed: Self {
        .init(consumedEnergy: (70 / 5) * 2,
              suppliedEnergy: 0,
              suppliedEnergyPercentage: 0,
              consumedEnergyPercentage: 100)
    }

    static var allSupplied: Self {
        .init(consumedEnergy: 0,
              suppliedEnergy: (70 / 5) * 2,
              suppliedEnergyPercentage: 100,
              consumedEnergyPercentage: 0)
    }

    static var suppliedAndConsuming: Self {
        .init(
            consumedEnergy: CustomMeasurement<KiloWattHour>((40 / 10) * 4.5),
            suppliedEnergy: CustomMeasurement<KiloWattHour>((70 / 10) * 4.5),
            suppliedEnergyPercentage: ((7.doubleValue / 11.doubleValue) * 100).round(toDecimals: 2),
            consumedEnergyPercentage: ((4.doubleValue / 11.doubleValue) * 100).round(toDecimals: 2)
        )
    }
}
