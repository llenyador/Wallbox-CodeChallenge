//
//  LiveDataProtocols.swift
//  
//
//  Created by Aitor Salvador García on 26/5/21.
//

import SharedUtilities

// sourcery: AutoMockable
public protocol LiveDataDataRepositoryProtocol {
    func getLiveData() -> PublisherResult<LiveData>
}

// sourcery: AutoMockable
protocol LiveDataRemoteDataSourceProtocol {
    func getLiveData() -> PublisherResult<LiveData>
}
