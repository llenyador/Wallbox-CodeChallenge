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
        // TODO
    }
}

// MARK: - Private
private extension DashboardRouter {}
