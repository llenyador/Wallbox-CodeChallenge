//
//  DashboardProtocols.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import Combine
import CoreLayout
import EMSDomain

// sourcery: AutoMockable
protocol DashboardViewDelegate: AnyObject {
    func didTapLiveStatsView()
}

// sourcery: AutoMockable
protocol DashboardViewControllerProtocol: AnyObject {
    func display(state: DashboardModels.ViewState)
}

// sourcery: AutoMockable
protocol DashboardInteractorProtocol {
    func viewDidLoad()
    func didTapLiveStatsView()
}

// sourcery: AutoMockable
protocol DashboardPresenterProtocol {
    func present(data: DashboardModels.Data)
    func present(error: Error)
    func presentLoading()
}

// sourcery: AutoMockable
protocol DashboardRouterProtocol {
    func routeToStats()
}

enum DashboardModels {
    enum ViewState: Equatable {
        case loading
        case showData(ViewModel)
        case error(message: String)
    }

    struct ViewModel: Equatable {
        let gaugeInfo: [GaugeInfoViewViewModel]
        let liveSessionVM: LiveSessionViewViewModel
        let liveStatsVM: LiveStatsViewViewModel
    }
}

extension DashboardModels {
    enum QuasarStatus {
        case providingEnergy(EnergySource)
        case consumingEnergy(CustomMeasurement<KiloWattHour>)
    }

    struct EnergySource {
        let power: CustomMeasurement<KiloWatt>
        let energy: CustomMeasurement<KiloWattHour>
        let suppliedPercentage: Double
    }

    struct Data {
        let quasarStatus: QuasarStatus
        let solarPower: EnergySource
        let gridPower: EnergySource
        let buildingDemandPower: CustomMeasurement<KiloWatt>
    }
}
