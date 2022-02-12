//
//  LiveStatsView.swift
//  EMSDisplay
//
//  Created by Aitor Salvador on 12/2/22.
//

import CoreLayout
import GaugeKit
import SharedUtilities

final class LiveStatsView: UIView {
    let titleLabel = Init(UILabel()) {
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 16)
    }
    let navigateImageView = Init(UIImageView()) {
        $0.image = .systemIconImage(.arrowRight, tintColor: .white)
    }
    let separatorView = Init(UIView()) {
        $0.backgroundColor = .white
    }
    let horizontalStack = Init(UIStackView()) {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    let emptyLabel = Init(UILabel()) {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension LiveStatsView {
    func display(viewModel: LiveStatsViewViewModel) {
        titleLabel.text = viewModel.titleText

        emptyLabel.isHidden = !viewModel.state.isEmpty
        horizontalStack.isHidden = !emptyLabel.isHidden
        switch viewModel.state {
        case let .empty(message):
            emptyLabel.text = message
        case let .gauges(gaugeVMs):
            displayGauges(for: gaugeVMs)
        }
    }
}

// MARK: - Private methods
private extension LiveStatsView {
    func setupView() {
        backgroundColor = .primary

        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubviews(
            titleLabel,
            navigateImageView,
            separatorView,
            horizontalStack,
            emptyLabel
        )
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(UIConstants.spacing10)
            $0.left.equalToSuperview()
                .offset(UIConstants.hMargin)
            $0.right.lessThanOrEqualTo(navigateImageView.snp.left)
                .inset(UIConstants.spacing6)
        }
        navigateImageView.snp.makeConstraints {
            $0.right.lessThanOrEqualToSuperview()
                .inset(UIConstants.hMargin)
            $0.centerY.equalTo(titleLabel)
        }
        separatorView.snp.makeConstraints {
            $0.height.equalTo(UIConstants.lineWidth)
            $0.top.equalTo(titleLabel.snp.bottom)
                .offset(UIConstants.spacing8)
            $0.left.right.equalToSuperview()
                .inset(UIConstants.hMargin)
        }
        horizontalStack.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom)
                .offset(UIConstants.spacing8)
            $0.left.right.equalToSuperview()
                .inset(UIConstants.hMargin)
            $0.bottom.equalToSuperview()
                .inset(UIConstants.spacing10)
        }
        horizontalStack.spacing = UIConstants.spacing4

        emptyLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(UIConstants.spacing10)
            $0.bottom.lessThanOrEqualToSuperview()
                .inset(UIConstants.spacing10)
            $0.centerHorizontallyToSuperview()
        }
    }

    func displayGauges(for viewModels: [GaugeInfoViewViewModel]) {
        viewModels.forEach { viewModel in
            let gauge = Init(
                GaugeInfoView()
            ) {
                $0.backgroundColor = .primary
                $0.gauge.bgColor = .white.withAlphaComponent(0.4)
                $0.gauge.startColor = .white
                $0.infoLabel.textColor = .white
                $0.valueLabel.textColor = .white
            }

            horizontalStack.addArrangedSubview(gauge)
            gauge.display(viewModel: viewModel,
                          animateValueChange: true)
        }
    }
}
