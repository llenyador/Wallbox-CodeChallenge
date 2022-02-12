//
//  DashboardInteractor.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import Combine
import SharedUtilities
import EMSDomain

final class DashboardInteractor {
    
    private let presenter: DashboardPresenterProtocol
    private let router: DashboardRouterProtocol
    private let worker: DashboardWorkerProtocol
    
    private var cancelables = Set<AnyCancellable>()
    
    init(
        presenter: DashboardPresenterProtocol,
        router: DashboardRouterProtocol,
        worker: DashboardWorkerProtocol
    ) {
        self.presenter = presenter
        self.router = router
        self.worker = worker
    }
}

// MARK: - DashboardInteractorProtocol
extension DashboardInteractor: DashboardInteractorProtocol {
    func viewDidLoad() {
        getDashboardData()
    }

    func didTapLiveStatsView() {
        router.routeToStats()
    }
}

// MARK: - Private methods
private extension DashboardInteractor {
    func getDashboardData() {
        presenter.presentLoading()

        worker.getLiveData()
            .sinkOnMain { [weak self] data in
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
