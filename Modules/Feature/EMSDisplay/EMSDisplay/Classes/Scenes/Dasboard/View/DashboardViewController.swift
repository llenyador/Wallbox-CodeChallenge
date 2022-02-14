//
//  DashboardViewController.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout
import SharedUtilities

final class DashboardViewController: BaseViewController {
    private let _view: DashboardView
    var interactor: DashboardInteractorProtocol!
    
    init(view: DashboardView) {
        _view = view
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        interactor.viewDidLoad()
    }
}

// MARK: - DashboardViewControllerProtocol
extension DashboardViewController: DashboardViewControllerProtocol {
    func display(state: DashboardModels.ViewState) {
        _view.loadingView.displayAnimating(state == .loading)
        switch state {
        case .loading:
            _view.scrollView.isHidden = true
            _view.errorLabel.isHidden = true
        case let .error(message):
            _view.scrollView.isHidden = true
            _view.errorLabel.isHidden = false
            _view.errorLabel.text = message
        case let .showData(viewModel):
            _view.scrollView.isHidden = false
            _view.errorLabel.isHidden = true
            _view.display(viewModel: viewModel)
        }
    }
}

// MARK: - DashboardViewControllerProtocol
extension DashboardViewController: DashboardViewDelegate {
    func didTapLiveStatsView() {
        interactor.didTapLiveStatsView()
    }
}

// MARK: - Setup methods
private extension DashboardViewController {
    func setupView() {
        title = "dashboard_title".localized
        _view.delegate = self
    }
}

// MARK: - Private methods
private extension DashboardViewController {
}
