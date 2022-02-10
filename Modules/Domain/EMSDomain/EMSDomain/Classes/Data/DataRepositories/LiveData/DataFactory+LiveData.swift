//
//  DataFactory+LiveData.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

enum DataFactory {
    static func build() -> NetworkClientProtocol {
        let bundle = Bundle(class: EMSDomainBundle.self,
                            bundleName: "MockedData") ?? .main
        return SharedUtilitiesFactory.build(
            bundle: bundle
        )
    }
}

// MARK: - Public
extension DataFactory {
    enum LiveData {
        public static func build() -> LiveDataDataRepositoryProtocol {
            LiveDataDataRepository(
                remoteDataSource: build()
            )
        }
    }
}

// MARK: - Private
private extension DataFactory.LiveData {
    static func build() -> LiveDataRemoteDataSourceProtocol {
        LiveDataRemoteDataSource(networkClient: DataFactory.build())
    }
}
