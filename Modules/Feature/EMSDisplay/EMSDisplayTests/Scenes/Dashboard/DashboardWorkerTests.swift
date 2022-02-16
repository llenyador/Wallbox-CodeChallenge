//
//  DashboardWorkerTests.swift
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import XCTest
import SwiftyMocky
import Combine
@testable import SharedTestingUtilities
@testable import EMSDisplay
@testable import EMSDomain
@testable import EMSDomainMocks

final class DashboardWorkerTests: XCTestCase {
    private var worker: DashboardWorker!
    private var getLiveDataUseCaseMock: GetLiveDataUseCaseProtocolMock!
    private var getQuasarsEnergyResumeUseCaseMock: GetQuasarsEnergyResumeUseCaseProtocolMock!

    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupDependencies()
    }
    
    override func tearDown() {
        super.tearDown()

        getLiveDataUseCaseMock = nil
        getQuasarsEnergyResumeUseCaseMock = nil
        worker = nil
    }

    // MARK: - Tests
    func testQuasarSupplyingEnergy() throws {
        let liveData = LiveData.any(quasarsPowerStatus: .supplyingEnergy(.any))
        let quasarsResume = QuasarsEnergyResume.any
        
        let expectedDashboardLiveData = DashboardModels.LiveData.quasarSupplyingEnergy(liveData)
        let expectedOutput = DashboardModels.Data(
            quasarsEnergyResume: quasarsResume,
            liveData: expectedDashboardLiveData
        )
        getQuasarsEnergyResumeUseCaseMock.given(.execute(willReturn: .just(quasarsResume)))
        getLiveDataUseCaseMock.given(.execute(willReturn: .just(liveData)))

        let publisher = worker.getData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)
        getLiveDataUseCaseMock.verifyOnce(.execute())
        getQuasarsEnergyResumeUseCaseMock.verifyOnce(.execute())
    }

    func testQuasarConsumingEnergy() throws {
        let liveData = LiveData.any(quasarsPowerStatus: .consumingEnergy(.any))
        let quasarsResume = QuasarsEnergyResume.any
        
        let expectedDashboardLiveData = DashboardModels.LiveData.quasarConsumingEnergy(liveData)
        let expectedOutput = DashboardModels.Data(
            quasarsEnergyResume: quasarsResume,
            liveData: expectedDashboardLiveData
        )
        getQuasarsEnergyResumeUseCaseMock.given(.execute(willReturn: .just(quasarsResume)))
        getLiveDataUseCaseMock.given(.execute(willReturn: .just(liveData)))

        let publisher = worker.getData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)
        getLiveDataUseCaseMock.verifyOnce(.execute())
        getQuasarsEnergyResumeUseCaseMock.verifyOnce(.execute())
    }

    func testGetLiveDataError() throws {
        let error = TestError.error1
        getLiveDataUseCaseMock.given(
            .execute(willReturn: .failure(error: error))
        )
        getQuasarsEnergyResumeUseCaseMock.given(
            .execute(willReturn: .just(.any))
        )

        let publisher = worker.getData()
        let outputError = try waitForPublisherError(publisher)
        assertError(outputError, isEqualToExpectedError: error)
        getLiveDataUseCaseMock.verifyOnce(.execute())
        getQuasarsEnergyResumeUseCaseMock.verifyOnce(.execute())
    }

    func testGetQuasarsEnergyResumeError() throws {
        let error = TestError.error1
        getLiveDataUseCaseMock.given(
            .execute(willReturn: .just(.any))
        )
        getQuasarsEnergyResumeUseCaseMock.given(
            .execute(willReturn: .failure(error: error))
        )

        let publisher = worker.getData()
        let outputError = try waitForPublisherError(publisher)
        assertError(outputError, isEqualToExpectedError: error)
        getLiveDataUseCaseMock.verifyOnce(.execute())
        getQuasarsEnergyResumeUseCaseMock.verifyOnce(.execute())
    }
}

// MARK: - Private methods
private extension DashboardWorkerTests {
    func setupDependencies() {
        getLiveDataUseCaseMock = .init()
        getQuasarsEnergyResumeUseCaseMock = .init()
        worker = .init(
            getLiveDataUseCase: getLiveDataUseCaseMock,
            getQuasarsEnergyResumeUseCase: getQuasarsEnergyResumeUseCaseMock
        )
    }
}

// MARK: - Model Helpers
private extension DashboardModels.LiveData {
    static func quasarSupplyingEnergy(_ liveData: LiveData) -> Self {
        let quasarsEnergySource: DashboardModels.EnergySource = .init(
            power: liveData.quasarsPowerStatus.power,
            suppliedPercentage: percentageFor(
                liveData.quasarsPowerStatus.power,
                buildingDemandPower: liveData.buildingDemandPower
            )
        )
        return .init(
            quasarStatus: .supplyingEnergy(quasarsEnergySource),
            solarPower: solarPower(liveData),
            gridPower: gridPower(liveData),
            buildingDemandPower: liveData.buildingDemandPower
        )
    }

    static func quasarConsumingEnergy(_ liveData: LiveData) -> Self {
        .init(
            quasarStatus: .consumingEnergy,
            solarPower: solarPower(liveData),
            gridPower: gridPower(liveData),
            buildingDemandPower: liveData.buildingDemandPower
        )
    }

    static func solarPower(_ liveData: LiveData) -> DashboardModels.EnergySource {
        .init(
            power: liveData.solarPower,
            suppliedPercentage: percentageFor(
                liveData.solarPower,
                buildingDemandPower: liveData.buildingDemandPower
            )
        )
    }

    static func gridPower(_ liveData: LiveData) -> DashboardModels.EnergySource {
        .init(
            power: liveData.gridPower,
            suppliedPercentage: percentageFor(
                liveData.gridPower,
                buildingDemandPower: liveData.buildingDemandPower
            )
        )
    }

    static func percentageFor(
        _ power: CustomMeasurement<KiloWatt>,
        buildingDemandPower: CustomMeasurement<KiloWatt>
    ) -> Double {
        (
            (power.value / buildingDemandPower.value) * 100
        ).round(toDecimals: 2)
    }
}
