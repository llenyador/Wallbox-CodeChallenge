//
//  GetLiveDataUseCase.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 9/2/22.
//

import SharedUtilities

// sourcery: AutoMockable
public protocol GetLiveDataUseCaseProtocol {
    func execute() -> PublisherResult<LiveData>
}

struct GetLiveDataUseCase {
    private let dataRepository: LiveDataDataRepositoryProtocol
    
    init(dataRepository: LiveDataDataRepositoryProtocol) {
        self.dataRepository = dataRepository
    }
}

// MARK: - GetLiveDataUseCaseProtocol
extension GetLiveDataUseCase: GetLiveDataUseCaseProtocol {
    func execute() -> PublisherResult<LiveData> {
        dataRepository.getLiveData()
    }
}
