//
//  HistoricalPlotsWorker.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import Combine
import EMSDomain
import SharedUtilities

// sourcery: AutoMockable
protocol HistoricalPlotsWorkerProtocol {
    func getHistoricalData() -> PublisherResult<[HistoricalData]>
}

// MARK: - HistoricalPlotsWorker
struct HistoricalPlotsWorker {
    private let getHistoricalDataUseCase: GetHistoricalDataUseCaseProtocol

    init(getHistoricalDataUseCase: GetHistoricalDataUseCaseProtocol) {
        self.getHistoricalDataUseCase = getHistoricalDataUseCase
    }
}

// MARK: - HistoricalPlotsWorkerProtocol
extension HistoricalPlotsWorker: HistoricalPlotsWorkerProtocol {
    func getHistoricalData() -> PublisherResult<[HistoricalData]> {
        getHistoricalDataUseCase.execute()
    }
}
