//
//  HistoricalDataProtocols.swift
//  
//
//  Created by Aitor Salvador García on 26/5/21.
//

import SharedUtilities

// sourcery: AutoMockable
public protocol HistoricalDataDataRepositoryProtocol {
    func getHistoricalData() -> PublisherResult<[HistoricalData]>
}

// sourcery: AutoMockable
protocol HistoricalDataRemoteDataSourceProtocol {
    func getHistoricalData() -> PublisherResult<[HistoricalData]>
}
