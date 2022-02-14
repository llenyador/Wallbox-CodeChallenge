//
//  HistoricalPlotsPresenter.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout
import SharedUtilities
import EMSDomain

final class HistoricalPlotsPresenter {
    private let globalMessage: ShowGlobalMessageProtocol
    private weak var viewController: HistoricalPlotsViewControllerProtocol?
    
    init(
        viewController: HistoricalPlotsViewControllerProtocol,
        globalMessage: ShowGlobalMessageProtocol
    ) {
        self.viewController = viewController
        self.globalMessage = globalMessage
    }
}

// MARK: - HistoricalPlotsPresenterProtocol
extension HistoricalPlotsPresenter: HistoricalPlotsPresenterProtocol {
    func present(data: [HistoricalData]) {
        guard let viewController = viewController else {
            return assertionFailure("viewController should not be nil")
        }
        do {
            let chartModel = try HistoricalDataToLineChartModelMapper.map(data)
            viewController.display(state: .showData(chartModel))
        } catch {
            present(error: error)
        }
        
    }

    func present(error: Error) {
        guard let viewController = viewController else {
            return assertionFailure("viewController should not be nil")
        }

        let errorMessage = ErrorMapper.map(error: error)
        globalMessage.showError(errorMessage: errorMessage)
        viewController.display(
            state: .error(message: "dashboard_generic_error".localized)
        )
    }

    func presentLoading() {
        guard let viewController = viewController else {
            return assertionFailure("viewController should not be nil")
        }

        viewController.display(state: .loading)
    }
}

// MARK: Private methods
private extension HistoricalPlotsPresenter {}
