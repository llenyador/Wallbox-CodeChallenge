//
//  AppDelegateRouter.swift
//  App
//
//  Created by Aitor Salvador on 31/12/21.
//  Copyright (c) 2021 Aitor Salvador. All rights reserved.
//

import CoreLayout
import EMSDisplay

final class AppDelegateRouter {
    private weak var window: UIWindow?

    private var topMostViewController: UIViewController? {
        var vc = window?.rootViewController?.presentedViewController
        if vc.isNil {
            vc = window?.rootViewController
        }
        return vc
    }

    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - AppDelegateRouterProtocol
extension AppDelegateRouter: AppDelegateRouterProtocol {
    func routeToInitialScreen() {
        let initialVC = EMSDisplayFactory.buildDashboard()
        let navC = UINavigationController(rootViewController: initialVC)
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
    }
}
