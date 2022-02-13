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

    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupDependencies()
    }
    
    override func tearDown() {
        super.tearDown()

        getLiveDataUseCaseMock = nil
        worker = nil
    }

    // MARK: - Tests
    func testQuasarProvidingEnergy() throws {
        let liveData = LiveData.any(quasarsPowerStatus: .providingEnergy(.any))
        let expectedOutput = DashboardModels.Data.quasarProvidingEnergy(liveData)
        getLiveDataUseCaseMock.given(.execute(willReturn: .just(liveData)))

        let publisher = worker.getLiveData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)
        getLiveDataUseCaseMock.verifyOnce(.execute())
    }

    func testQuasarConsumingEnergy() throws {
        let liveData = LiveData.any(quasarsPowerStatus: .consumingEnergy(.any))
        let expectedOutput = DashboardModels.Data.quasarConsumingEnergy(liveData)
        getLiveDataUseCaseMock.given(.execute(willReturn: .just(liveData)))

        let publisher = worker.getLiveData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)
        getLiveDataUseCaseMock.verifyOnce(.execute())
    }
}

// MARK: - Private methods
private extension DashboardWorkerTests {
    func setupDependencies() {
        getLiveDataUseCaseMock = .init()
        worker = .init(
            getLiveDataUseCase: getLiveDataUseCaseMock
        )
    }
}

// MARK: - Model Helpers
private extension DashboardModels.Data {
    static func quasarProvidingEnergy(_ liveData: LiveData) -> Self {
        let quasarsEnergySource: DashboardModels.EnergySource = .init(
            power: liveData.quasarsPowerStatus.power,
            energy: EnergyConversion.convertToKWh(liveData.quasarsPowerStatus.power),
            suppliedPercentage: percentageFor(
                liveData.quasarsPowerStatus.power,
                buildingDemandPower: liveData.buildingDemandPower
            )
        )
        return .init(quasarStatus: .providingEnergy(quasarsEnergySource),
                     solarPower: solarPower(liveData),
                     gridPower: gridPower(liveData),
                     buildingDemandPower: liveData.buildingDemandPower)
    }

    static func quasarConsumingEnergy(_ liveData: LiveData) -> Self {
        let quasarEnergy = EnergyConversion.convertToKWh(
            liveData.quasarsPowerStatus.power
        )
        return .init(quasarStatus: .consumingEnergy(quasarEnergy),
                     solarPower: solarPower(liveData),
                     gridPower: gridPower(liveData),
                     buildingDemandPower: liveData.buildingDemandPower)
    }

    static func solarPower(_ liveData: LiveData) -> DashboardModels.EnergySource {
        .init(
            power: liveData.solarPower,
            energy: EnergyConversion.convertToKWh(liveData.solarPower),
            suppliedPercentage: percentageFor(
                liveData.solarPower,
                buildingDemandPower: liveData.buildingDemandPower
            )
        )
    }

    static func gridPower(_ liveData: LiveData) -> DashboardModels.EnergySource {
        .init(
            power: liveData.gridPower,
            energy: EnergyConversion.convertToKWh(liveData.gridPower),
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
