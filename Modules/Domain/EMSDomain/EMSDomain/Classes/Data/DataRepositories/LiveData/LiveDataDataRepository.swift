//
//  LiveDataDataRepository.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

// MARK: - LiveDataDataRepository
struct LiveDataDataRepository {
    private let remoteDataSource: LiveDataRemoteDataSourceProtocol

    init(
        remoteDataSource: LiveDataRemoteDataSourceProtocol
    ) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - LiveDataRepositoryProtocol
extension LiveDataDataRepository: LiveDataDataRepositoryProtocol {
    func getLiveData() -> PublisherResult<LiveData> {
        remoteDataSource.getLiveData()
    }
}
