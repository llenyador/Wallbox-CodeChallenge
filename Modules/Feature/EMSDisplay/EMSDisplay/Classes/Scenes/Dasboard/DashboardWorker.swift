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
    func getData() -> PublisherResult<DashboardModels.Data>
}

// MARK: - DashboardWorker
struct DashboardWorker {
    private let getLiveDataUseCase: GetLiveDataUseCaseProtocol
    private let getQuasarsEnergyResumeUseCase: GetQuasarsEnergyResumeUseCaseProtocol

    init(
        getLiveDataUseCase: GetLiveDataUseCaseProtocol,
        getQuasarsEnergyResumeUseCase: GetQuasarsEnergyResumeUseCaseProtocol
    ) {
        self.getLiveDataUseCase = getLiveDataUseCase
        self.getQuasarsEnergyResumeUseCase = getQuasarsEnergyResumeUseCase
    }
}

// MARK: - DashboardWorkerProtocol
extension DashboardWorker: DashboardWorkerProtocol {
    func getData() -> PublisherResult<DashboardModels.Data> {
        Publishers.Zip(
            getDashboardLiveData(),
            getQuasarsEnergyResumeUseCase.execute()
        ).map { liveData, quasarsEnergyResume in
                .init(
                    quasarsEnergyResume: quasarsEnergyResume,
                    liveData: liveData
                )
        }.eraseToAnyPublisher()
    }
}

// MARK: - Private methods
private extension DashboardWorker {
    func getDashboardLiveData() -> PublisherResult<DashboardModels.LiveData> {
        getLiveDataUseCase.execute()
            .map {
                mapToDashboardLiveData($0)
            }.eraseToAnyPublisher()
    }
    
    func mapToDashboardLiveData(
        _ liveData: LiveData
    ) -> DashboardModels.LiveData {
        let solarPower = DashboardModels.EnergySource(
            power: liveData.solarPower,
            suppliedPercentage: liveData.solarPower.asPercentage(
                forTotal: liveData.buildingDemandPower
            )
        )
        let gridPower = DashboardModels.EnergySource(
            power: liveData.gridPower,
            suppliedPercentage: liveData.gridPower.asPercentage(
                forTotal: liveData.buildingDemandPower
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
    ) -> DashboardModels.DashboardQuasarStatus {
        let quasarsPower = liveData.quasarsPowerStatus.power
        switch liveData.quasarsPowerStatus {
        case .supplyingEnergy:
            let energySource = DashboardModels.EnergySource(
                power: quasarsPower,
                suppliedPercentage: quasarsPower.asPercentage(
                    forTotal: liveData.buildingDemandPower
                )
            )
            return .supplyingEnergy(energySource)
            
        case .consumingEnergy:
            return .consumingEnergy
        }
    }
}

