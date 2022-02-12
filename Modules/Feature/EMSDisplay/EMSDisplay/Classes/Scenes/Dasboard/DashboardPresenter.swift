//
//  DashboardPresenter.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout
import EMSDomain

final class DashboardPresenter {
    
    private weak var viewController: DashboardViewControllerProtocol?
    
    init(
        viewController: DashboardViewControllerProtocol
    ) {
        self.viewController = viewController
    }
}

// MARK: - DashboardPresenterProtocol
extension DashboardPresenter: DashboardPresenterProtocol {}

// MARK: Private methods
private extension DashboardPresenter {}
