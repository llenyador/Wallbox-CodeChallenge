//
//  LiveDataRemoteDataSource.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

// MARK: - LiveDataRemoteDataSource
struct LiveDataRemoteDataSource {
    private let networkClient: NetworkClientProtocol

    init(
        networkClient: NetworkClientProtocol
    ) {
        self.networkClient = networkClient
    }
}

// MARK: - LiveDataRemoteDataSourceProtocol
extension LiveDataRemoteDataSource: LiveDataRemoteDataSourceProtocol {
    func getLiveData() -> PublisherResult<LiveData> {
        let endpoint = Endpoint.LiveData.getLiveData
        return networkClient.perform(
            endpoint: endpoint,
            mapper: LiveDataDTOToLiveDataMapper.self
        )
    }
}
