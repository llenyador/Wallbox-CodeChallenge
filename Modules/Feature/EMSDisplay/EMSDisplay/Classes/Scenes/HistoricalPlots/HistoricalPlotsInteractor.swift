//
//  HistoricalPlotsInteractor.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import Combine
import SharedUtilities

final class HistoricalPlotsInteractor<
    Scheduler: Combine.Scheduler
> {
    
    private let presenter: HistoricalPlotsPresenterProtocol
    private let router: HistoricalPlotsRouterProtocol
    private let worker: HistoricalPlotsWorkerProtocol
    private let scheduler: Scheduler
    
    private var cancelables = Set<AnyCancellable>()
    
    init(
        presenter: HistoricalPlotsPresenterProtocol,
        router: HistoricalPlotsRouterProtocol,
        worker: HistoricalPlotsWorkerProtocol,
        scheduler: Scheduler
    ) {
        self.presenter = presenter
        self.router = router
        self.worker = worker
        self.scheduler = scheduler
    }
}

// MARK: - HistoricalPlotsInteractorProtocol
extension HistoricalPlotsInteractor: HistoricalPlotsInteractorProtocol {
    func viewDidLoad() {
        getHistoricalData()
    }
}

// MARK: - Private methods
private extension HistoricalPlotsInteractor {
    func getHistoricalData() {
        presenter.presentLoading()

        worker.getHistoricalData()
            .receive(on: scheduler)
            .sink { [weak self] data in
                guard let self = self else {
                    return
                }
                self.presenter.present(data: data)
            } onFailure: { [weak self] error in
                guard let self = self else {
                    return
                }
                self.presenter.present(error: error)
            }.store(in: &cancelables)

    }
}
