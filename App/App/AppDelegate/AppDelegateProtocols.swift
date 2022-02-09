//
//  AppDelegateProtocols.swift
//  App
//
//  Created by Aitor Salvador on 31/12/21.
//  Copyright (c) 2021 Aitor Salvador. All rights reserved.
//

import Combine

// sourcery: AutoMockable
protocol AppDelegateInteractorProtocol {
    func windowWillConect()
}

// sourcery: AutoMockable
protocol AppDelegateRouterProtocol {
    func routeToInitialScreen()
}

enum AppDelegateModels {}

