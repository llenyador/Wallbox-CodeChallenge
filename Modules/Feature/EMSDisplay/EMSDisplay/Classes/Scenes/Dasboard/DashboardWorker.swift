//
//  DashboardWorker.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import Combine
import EMSDomain
import SharedUtilities

// sourcery: AutoMockable
protocol DashboardWorkerProtocol {
    func getLiveData() -> PublisherResult<DashboardModels.Data>
}

// MARK: - DashboardWorker
struct DashboardWorker {
    private let getLiveDataUseCase: GetLiveDataUseCaseProtocol

    init(
        getLiveDataUseCase: GetLiveDataUseCaseProtocol
    ) {
        self.getLiveDataUseCase = getLiveDataUseCase
    }
}

// MARK: - DashboardWorkerProtocol
extension DashboardWorker: DashboardWorkerProtocol {
    func getLiveData() -> PublisherResult<DashboardModels.Data> {
        getLiveDataUseCase.execute()
            .map {
                mapToDashboardLiveData($0)
            }.eraseToAnyPublisher()
    }
}

// MARK: - Private methods
private extension DashboardWorker {
    func mapToDashboardLiveData(
        _ liveData: LiveData
    ) -> DashboardModels.Data {
        
        let solarPower = DashboardModels.EnergySource(
            power: liveData.solarPower,
            energy: EnergyConversion.convertToKWh(liveData.solarPower),
            suppliedPercentage: percentageFor(
                liveData.solarPower,
                buildingDemandPower: liveData.buildingDemandPower
            )
        )
        let gridPower = DashboardModels.EnergySource(
            power: liveData.gridPower,
            energy: EnergyConversion.convertToKWh(liveData.gridPower),
            suppliedPercentage: percentageFor(
                liveData.gridPower,
                buildingDemandPower: liveData.buildingDemandPower
            )
        )

        return .init(
            quasarStatus: mapToQuasarsStatus(liveData),
            solarPower: solarPower,
            gridPower: gridPower,
            buildingDemandPower: liveData.buildingDemandPower
        )
    }

    func mapToQuasarsStatus(
        _ liveData: LiveData
    ) -> DashboardModels.QuasarStatus {
        let quasarsPower = liveData.quasarsPowerStatus.power
        let quasarEnergy = EnergyConversion.convertToKWh(quasarsPower)
        switch liveData.quasarsPowerStatus {
        case .supplyingEnergy:
            let energySource = DashboardModels.EnergySource(
                power: quasarsPower,
                energy: EnergyConversion.convertToKWh(quasarsPower),
                suppliedPercentage: percentageFor(
                    quasarsPower,
                    buildingDemandPower: liveData.buildingDemandPower
                )
            )
            return .supplyingEnergy(energySource)
            
        case .consumingEnergy:
            return .consumingEnergy(quasarEnergy)
        }
    }

    func percentageFor(
        _ power: CustomMeasurement<KiloWatt>,
        buildingDemandPower: CustomMeasurement<KiloWatt>
    ) -> Double {
        (
            (power.value / buildingDemandPower.value) * 100
        ).round(toDecimals: 2)
    }
}

