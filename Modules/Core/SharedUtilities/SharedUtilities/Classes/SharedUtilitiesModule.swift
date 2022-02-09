//
//  SharedUtilitiesModule.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 01/08/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

public enum SharedUtilitiesModule {
    #if DEBUG
    static var isFakeNetworkEnabled: () -> Bool = { false }

    public static func initializeEnvironment(
        isFakeNetworkEnabled: @escaping () -> Bool
    ) {
        self.isFakeNetworkEnabled = isFakeNetworkEnabled
    }
    #endif

    public static func initializeErrorTracker(errorTracker: ErrorTrackerInterface) {
        ErrorTracker.tracker = errorTracker
    }
}
