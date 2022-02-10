//
//  HistoricalDataDataRepository.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

// MARK: - HistoricalDataDataRepository
struct HistoricalDataDataRepository {
    private let remoteDataSource: HistoricalDataRemoteDataSourceProtocol

    init(remoteDataSource: HistoricalDataRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - HistoricalDataRepositoryProtocol
extension HistoricalDataDataRepository: HistoricalDataDataRepositoryProtocol {
    func getHistoricalData() -> PublisherResult<[HistoricalData]> {
        remoteDataSource.getHistoricalData()
    }
}
