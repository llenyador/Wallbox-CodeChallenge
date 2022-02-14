//
//  HistoricalPlotsProtocols.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import Combine
import CoreLayout
import EMSDomain

// sourcery: AutoMockable
protocol HistoricalPlotsViewDelegate: AnyObject {}

// sourcery: AutoMockable
protocol HistoricalPlotsViewControllerProtocol: AnyObject {
    func display(state: HistoricalPlotsModels.ViewState)
}

// sourcery: AutoMockable
protocol HistoricalPlotsInteractorProtocol {
    func viewDidLoad()
}

// sourcery: AutoMockable
protocol HistoricalPlotsPresenterProtocol {
    func present(data: [HistoricalData])
    func present(error: Error)
    func presentLoading()
}

// sourcery: AutoMockable
protocol HistoricalPlotsRouterProtocol {}

enum HistoricalPlotsModels {
    enum ViewState: Equatable {
        case loading
        case showData(LineChartModel)
        case error(message: String)
    }

    struct ViewModel: Equatable {}

    struct Data {}
}
