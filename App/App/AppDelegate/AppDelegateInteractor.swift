//
//  AppDelegateInteractor.swift
//  App
//
//  Created by Aitor Salvador on 31/12/21.
//  Copyright (c) 2021 Aitor Salvador. All rights reserved.
//

import SharedUtilities

final class AppDelegateInteractor {
    private let router: AppDelegateRouterProtocol
    
    init(
        router: AppDelegateRouterProtocol
    ) {
        self.router = router
    }
}

// MARK: - AppDelegateInteractorProtocol
extension AppDelegateInteractor: AppDelegateInteractorProtocol {
    func windowWillConect() {
        router.routeToInitialScreen()
    }
}
