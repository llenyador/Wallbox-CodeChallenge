//
//  HistoricalPlotsRouter.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
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
