//
//  HistoricalPlotsFactory.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import SwiftUI
import CoreLayout
import EMSDomain

// MARK: - Setup

enum HistoricalPlotsFactory {
    static func buildScene(
    ) -> UIViewController {
        let view = HistoricalPlotsView()
        let viewController = HistoricalPlotsViewController(view: view)
        let presenter = buildPresenter(viewController: viewController)
        let router = build(viewController: viewController)
        let interactor = buildInteractor(presenter: presenter, router: router)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
    
private extension HistoricalPlotsFactory {
    static func buildInteractor(
        presenter: HistoricalPlotsPresenterProtocol,
        router: HistoricalPlotsRouterProtocol
    ) -> HistoricalPlotsInteractorProtocol {
        HistoricalPlotsInteractor(
            presenter: presenter,
            router: router,
            worker: build(),
            scheduler: DispatchQueue.main
        )
    }
    
    static func buildPresenter(
        viewController: HistoricalPlotsViewControllerProtocol
    ) -> HistoricalPlotsPresenterProtocol {
        HistoricalPlotsPresenter(
            viewController: viewController,
            globalMessage: CoreLayoutFactory.build()
        )
    }

    static func build() -> HistoricalPlotsWorkerProtocol {
        HistoricalPlotsWorker(
            getHistoricalDataUseCase: EMSDomainFactory.build()
        )
    }

    static func build(
        viewController: UIViewController
    ) -> HistoricalPlotsRouterProtocol {
        HistoricalPlotsRouter(
            viewController: viewController
        )
    }
}
