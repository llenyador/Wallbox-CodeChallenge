//
//  GetHistoricalDataUseCase.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

public struct HistoricalData {
    public let buildingActivePower: Measurement<KiloWatt>
    public let gridActivePower: Measurement<KiloWatt>
    public let pvActivePower: Measurement<KiloWatt>
    public let quasarsActivePower: Measurement<KiloWatt>
    public let timestamp: Date
}

// sourcery: AutoMockable
public protocol GetHistoricalDataUseCaseProtocol {
    func execute() -> PublisherResult<[HistoricalData]>
}

struct GetHistoricalDataUseCase {
    private let dataRepository: HistoricalDataDataRepositoryProtocol
    
    init(dataRepository: HistoricalDataDataRepositoryProtocol) {
        self.dataRepository = dataRepository
    }
}

// MARK: - GetHistoricalDataUseCaseProtocol
extension GetHistoricalDataUseCase: GetHistoricalDataUseCaseProtocol {
    func execute() -> PublisherResult<[HistoricalData]> {
        return dataRepository.getHistoricalData()
    }
}
