//
//  AppDelegateFactory.swift
//  App
//
//  Created by Aitor Salvador on 31/12/21.
//  Copyright (c) 2021 Aitor Salvador. All rights reserved.
//

import CoreLayout

// MARK: - Setup

enum AppDelegateFactory {
    static func buildScene(
        inWindow window: UIWindow
    ) -> AppDelegateInteractorProtocol {
        let router = build(window: window)
        return buildInteractor(router: router)
    }
}

// MARK: - Private methods
private extension AppDelegateFactory {
    static func buildInteractor(
        router: AppDelegateRouterProtocol
    ) -> AppDelegateInteractorProtocol {
        AppDelegateInteractor(
            router: router
        )
    }
    
    static func build(
        window: UIWindow
    ) -> AppDelegateRouterProtocol {
        AppDelegateRouter(window: window)
    }
}
