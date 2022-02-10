//
//  HistoricalDataRemoteDataSource.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

// MARK: - HistoricalDataRemoteDataSource
struct HistoricalDataRemoteDataSource {
    private let networkClient: NetworkClientProtocol

    init(
        networkClient: NetworkClientProtocol
    ) {
        self.networkClient = networkClient
    }
}

// MARK: - HistoricalDataRemoteDataSourceProtocol
extension HistoricalDataRemoteDataSource: HistoricalDataRemoteDataSourceProtocol {
    func getHistoricalData() -> PublisherResult<[HistoricalData]> {
        let endpoint = Endpoint.HistoricalData.getHistoricalData
        return networkClient.perform(
            endpoint: endpoint,
            arrayMapper: HistoricalDataDTOToHistoricalDataMapper.self
        )
    }
}
