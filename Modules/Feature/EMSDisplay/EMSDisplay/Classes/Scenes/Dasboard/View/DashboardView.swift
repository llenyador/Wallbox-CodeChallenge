//
//  DashboardView.swift
//  Pods
//
//  Created by Aitor Salvador on 10/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout
import UIKit

final class DashboardView: UIView {
    let loadingView = Init(LoadingView(style: .ballPulseSyncPrimary)) {
        $0.displayAnimating(false)
    }
    let scrollView = Init(UIScrollView()) {
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
        $0.contentInset = .vertical(UIConstants.spacing10)
    }
    let contentStackView = Init(UIStackView()) {
        $0.axis = .vertical
        $0.alignment = .center
    }
    let liveSessionView = Init(LiveSessionView()) {
        $0.display(shadowStyle: .allSides)
        $0.layer.cornerRadius = UIConstants.Radius.radius10
    }
    let liveStatsView = Init(LiveStatsView()) {
        $0.display(shadowStyle: .allSides)
        $0.layer.cornerRadius = UIConstants.Radius.radius10
    }

    weak var delegate: DashboardViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func display(viewModel: DashboardModels.ViewModel) {
        displayGauges(for: viewModel.gaugeInfo)
        liveSessionView.display(viewModel: viewModel.liveSessionVM)
        liveStatsView.display(viewModel: viewModel.liveStatsVM)
    }
}

// MARK: - Private
private extension DashboardView {
    func setupView() {
        backgroundColor = .white

        addSubviews()
        setupConstraints()
        setupActions()
    }

    func addSubviews() {
        addSubviews(
            loadingView,
            scrollView
        )
        contentStackView.addArrangedSubviews(
            liveSessionView,
            liveStatsView
        )
    }

    func setupConstraints() {
        loadingView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        scrollView.embedContainerVerticalStackView(contentStackView)
        contentStackView.spacing = UIConstants.spacing16

        liveSessionView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
                .inset(UIConstants.hMargin)
        }
        liveStatsView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
                .inset(UIConstants.hMargin)
        }
    }

    func setupActions() {
        liveStatsView.addTap(self,
                             action: #selector(didTapLiveStatsView))
    }
}

// MARK: - Actions
private extension DashboardView {
    @objc
    func didTapLiveStatsView() {
        delegate?.didTapLiveStatsView()
    }
}

// MARK: - Private methods
private extension DashboardView {
    func displayGauges(for viewModels: [GaugeInfoViewViewModel]) {
        viewModels.enumerated().forEach { (index, viewModel) in
            let gauge = Init(
                GaugeInfoView(insets: .all(UIConstants.spacing12))
            ) {
                $0.layer.cornerRadius = UIConstants.Radius.radius10
                $0.display(shadowStyle: .allSides)
            }

            contentStackView.insertArrangedSubview(gauge, at: index)

            gauge.snp.makeConstraints {
                $0.left.right.equalToSuperview()
                    .priority(.high)
                $0.width.lessThanOrEqualTo(Constants.maxWidth)
                    .priority(.required)
            }
            gauge.display(viewModel: viewModel,
                          animateValueChange: true)
        }
    }
}

// MARK: - Constants
private extension DashboardView {
    enum Constants {
        static let maxWidth: CGFloat = 200
        static let gaugeInfoBorderWidth: CGFloat = 0.2
    }
}
