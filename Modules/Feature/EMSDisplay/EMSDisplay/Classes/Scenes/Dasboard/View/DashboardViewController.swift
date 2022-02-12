//
//  DashboardViewController.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout
import SharedUtilities

final class DashboardViewController: UIViewController {
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        display(state: .loading)
        delay(0.5) {
            let liveSessionVM = LiveSessionViewViewModel(
                titleText: "Current session",
                sourcePower1VM: .init(topText: "Solar power",
                                      bottomText: "7.82 kW"),
                sourcePower2VM: .init(topText: "Quasar power",
                                      bottomText: "38.73 kW"),
                sourcePower3VM: .init(topText: "Grid power",
                                      bottomText: "80.48 kW"),
                totalPowerVM: .init(topText: "Building total demand",
                                    bottomText: "127.03 kW")
            )
            let liveStatsVM = LiveStatsViewViewModel(
                titleText: "Current session stats",
                state: .gauges(
                    gaugeVMs: [
                        .init(infoText: "Solar power",
                              value: 0.1,
                              valueText: "10%"),
                        .init(infoText: "Quasar power",
                              value: 0.3,
                              valueText: "30%"),
                        .init(infoText: "Quasar power",
                              value: 0.6,
                              valueText: "60%")
                    ]
                )
            )
            
            
            self.display(
                state: .showData(
                    .init(
                        gaugeInfo: [
                            .init(infoText: "Quasar charge",
                                  value: 1,
                                  valueText: "5 kWh")
                        ],
                        liveSessionVM: liveSessionVM,
                        liveStatsVM: liveStatsVM
                    )
                )
            )
        }
    }
}

// MARK: - DashboardViewControllerProtocol
extension DashboardViewController: DashboardViewControllerProtocol {
    func display(state: DashboardModels.ViewState) {
        _view.loadingView.displayAnimating(state == .loading)
        switch state {
        case .loading:
            _view.scrollView.isHidden = true
        case let .error(message):
            _view.scrollView.isHidden = true
        case let .showData(viewModel):
            _view.scrollView.isHidden = false
            _view.display(viewModel: viewModel)
        }
    }
}

// MARK: - DashboardViewControllerProtocol
extension DashboardViewController: DashboardViewDelegate {
    func didTapLiveStatsView() {
        
    }
}

// MARK: - Setup methods
private extension DashboardViewController {
    func setupView() {
        title = "Dashboard"
        _view.delegate = self
    }
}

// MARK: - Private methods
private extension DashboardViewController {
}
