//
//  DataFactory+HistoricalData.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

// MARK: - Public
extension DataFactory {
    enum HistoricalData {
        public static func build() -> HistoricalDataDataRepositoryProtocol {
            HistoricalDataDataRepository(
                remoteDataSource: build()
            )
        }
    }
}

// MARK: - Private
private extension DataFactory.HistoricalData {
    static func build() -> HistoricalDataRemoteDataSourceProtocol {
        HistoricalDataRemoteDataSource(networkClient: DataFactory.build())
    }
}
