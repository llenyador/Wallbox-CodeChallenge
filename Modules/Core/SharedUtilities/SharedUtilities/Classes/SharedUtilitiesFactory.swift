//
//  SharedUtilitiesFactory.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 29/06/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public struct SharedUtilitiesFactory {
    public static func build() -> UserDefaultsWrapperProtocol {
        UserDefaultsWrapper(userDefaults: .standard)
    }
    
    public static func build() -> ObfuscatorProtocol {
        Obfuscator()
    }

    public static func build(bundle: Bundle = .main) -> NetworkClientProtocol {
        #if DEBUG
        NetworkClientState(
            realNetworkClient: buildRealNetworkClient(),
            fakeNetworkClient: buildFakeNetworkClient(bundle: bundle)
        )
        #else
        buildRealNetworkClient()
        #endif
    }
}

private extension SharedUtilitiesFactory {
    #if DEBUG
    static func buildFakeNetworkClient(bundle: Bundle) -> NetworkClientProtocol {
        FakeNetworkClient(bundle: bundle)
    }
    #endif

    static func buildRealNetworkClient() -> NetworkClientProtocol {
        NetworkClient()
    }
}
