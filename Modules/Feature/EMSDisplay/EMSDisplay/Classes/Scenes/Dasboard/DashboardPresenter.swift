//
//  DashboardPresenter.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout
import EMSDomain
import SharedUtilities

final class DashboardPresenter {
    
    private let globalMessage: ShowGlobalMessageProtocol
    private weak var viewController: DashboardViewControllerProtocol?
    
    init(
        viewController: DashboardViewControllerProtocol,
        globalMessage: ShowGlobalMessageProtocol
    ) {
        self.viewController = viewController
        self.globalMessage = globalMessage
    }
}

// MARK: - DashboardPresenterProtocol
extension DashboardPresenter: DashboardPresenterProtocol {
    func present(data: DashboardModels.Data) {
        guard let viewController = viewController else {
            return assertionFailure("viewController should not be nil")
        }

        do {
            let viewModel = try DashboardViewModelMapper.map(data)
            viewController.display(
                state: .showData(viewModel)
            )
        } catch {
            assertionFailure("DashboardViewModelMapper should not throw errors")
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
private extension DashboardPresenter {}
