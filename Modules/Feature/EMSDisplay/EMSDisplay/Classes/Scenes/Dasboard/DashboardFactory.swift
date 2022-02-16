//
//  DashboardFactory.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout
import EMSDomain

// MARK: - Setup

public enum DashboardFactory {
    public static func buildScene() -> UIViewController {
        let view = DashboardView()
        let viewController = DashboardViewController(view: view)
        let presenter = buildPresenter(viewController: viewController)
        let router = build(viewController: viewController)
        let interactor = buildInteractor(presenter: presenter, router: router)
        
        viewController.interactor = interactor
        
        return viewController
    }
}

private extension DashboardFactory {
    static func buildInteractor(
        presenter: DashboardPresenterProtocol,
        router: DashboardRouterProtocol
    ) -> DashboardInteractorProtocol {
        DashboardInteractor(
            presenter: presenter,
            router: router,
            worker: build(),
            scheduler: DispatchQueue.main
        )
    }
    
    static func buildPresenter(
        viewController: DashboardViewControllerProtocol
    ) -> DashboardPresenterProtocol {
        DashboardPresenter(
            viewController: viewController,
            globalMessage: CoreLayoutFactory.build()
        )
    }
    
    static func build() -> DashboardWorkerProtocol {
        DashboardWorker(
            getLiveDataUseCase: EMSDomainFactory.build(),
            getHistoricalDataUseCase: EMSDomainFactory.build()
        )
    }
    
    static func build(
        viewController: UIViewController
    ) -> DashboardRouterProtocol {
        DashboardRouter(
            viewController: viewController
        )
    }
}
