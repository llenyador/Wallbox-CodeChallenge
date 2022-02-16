//
//  HistoricalPlotsView.swift
//  Pods
//
//  Created by Aitor Salvador on 13/2/22.
//  Copyright (c) 2022 Aitor Salvador. All rights reserved.
//

import CoreLayout

final class HistoricalPlotsView: UIView {
    let loadingView = Init(LoadingView(style: .ballPulseSyncPrimary)) {
        $0.displayAnimating(false)
    }
    let errorLabel = Init(UILabel()) {
        $0.textColor = .lightGray
    }
    let chartView = Init(ChartView())
    let scrollView = Init(UIScrollView()) {
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
        $0.contentInset = .vertical(UIConstants.spacing10)
    }
    let contentView = Init(UIView())

    weak var delegate: HistoricalPlotsViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
private extension HistoricalPlotsView {
    func setupView() {
        backgroundColor = .white

        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubviews(
            loadingView,
            errorLabel,
            scrollView
        )
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            chartView
        )
    }

    func setupConstraints() {
        loadingView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        errorLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        chartView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
                .inset(UIConstants.hMargin)
            $0.aspectRatio(Constants.chartAspectRatio,
                           inView: chartView)
            $0.top.equalToSuperview()
        }
    }
}

// MARK: - Constants
private extension HistoricalPlotsView {
    enum Constants {
        static let chartAspectRatio = CGSize(width: 2, height: 3.6)
    }
}
