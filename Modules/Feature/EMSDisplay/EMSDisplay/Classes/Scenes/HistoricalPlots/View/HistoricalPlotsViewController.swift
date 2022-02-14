//
//  HistoricalPlotsViewController.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout

final class HistoricalPlotsViewController: BaseViewController {
    private let _view: HistoricalPlotsView
    var interactor: HistoricalPlotsInteractorProtocol!
    
    init(view: HistoricalPlotsView) {
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

// MARK: - HistoricalPlotsViewControllerProtocol
extension HistoricalPlotsViewController: HistoricalPlotsViewControllerProtocol {
    func display(state: HistoricalPlotsModels.ViewState) {
        _view.loadingView.displayAnimating(state == .loading)
        switch state {
        case .loading:
            _view.chartView.isHidden = true
            _view.errorLabel.isHidden = true
        case let .error(message):
            _view.chartView.isHidden = true
            _view.errorLabel.isHidden = false
            _view.errorLabel.text = message
        case let .showData(chartModel):
            _view.chartView.isHidden = false
            _view.errorLabel.isHidden = true
            _view.chartView.display(model: chartModel)
        }
    }
}

// MARK: - Setup methods
private extension HistoricalPlotsViewController {
    func setupView() {
        title = "historical_plots_title".localized
    }
}
