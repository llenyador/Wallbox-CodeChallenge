//
//  HistoricalPlotsRouter.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import CoreLayout

final class HistoricalPlotsRouter {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - HistoricalPlotsRouterProtocol
extension HistoricalPlotsRouter: HistoricalPlotsRouterProtocol {}

// MARK: - Private
private extension HistoricalPlotsRouter {}
