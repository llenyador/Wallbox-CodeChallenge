//
//  DashboardRouter.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout

final class DashboardRouter {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - DashboardRouterProtocol
extension DashboardRouter: DashboardRouterProtocol {
    func routeToStats() {
        guard let viewController = viewController else {
            return assertionFailure("viewController should not be nil")
        }
        let vc = HistoricalPlotsFactory.buildScene()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Private
private extension DashboardRouter {}
