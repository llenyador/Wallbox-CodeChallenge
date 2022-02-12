//
//  DashboardProtocols.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import Combine
import EMSDomain

// sourcery: AutoMockable
protocol DashboardViewDelegate: AnyObject {
    func didTapLiveStatsView()
}

// sourcery: AutoMockable
protocol DashboardViewControllerProtocol: AnyObject {}

// sourcery: AutoMockable
protocol DashboardInteractorProtocol {
    func viewDidLoad()
    func didTapLiveStatsView()
}

// sourcery: AutoMockable
protocol DashboardPresenterProtocol {}

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
