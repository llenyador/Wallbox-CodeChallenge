//
//  GaugeInfoView.swift
//  EMSDisplay_Example
//
//  Created by Aitor Salvador on 11/2/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import GaugeKit
import SharedUtilities

public final class GaugeInfoView: UIView {
    private let wrapperView = Init(UIView())
    public let gauge = Init(Gauge()) {
        $0.maxValue = 1
        $0.rate = 0
        $0.startColor = .primary
        $0.bgColor = .lightGray
        $0.lineWidth = Constants.gaugeLineWidth
    }
    public let valueLabel = Init(UILabel()) {
        $0.textColor = .black
        $0.textAlignment = .center
    }
    public let infoLabel = Init(UILabel()) {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    private let insets: UIEdgeInsets
    private var topLabelConstraint: Constraint!
    private var bottomGaugeConstraint: Constraint!

    public init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: .zero)
        setupView()
    }

    public override init(frame: CGRect) {
        insets = .zero
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
public extension GaugeInfoView {
    func display(viewModel: GaugeInfoViewViewModel,
                 animateValueChange: Bool,
                 completion: (() -> Void)? = nil) {
        infoLabel.isHidden = viewModel.infoText.isEmpty
        topLabelConstraint.isActive = !infoLabel.isHidden
        bottomGaugeConstraint.isActive = !topLabelConstraint.isActive
        infoLabel.text = viewModel.infoText
        valueLabel.text = viewModel.valueText
        if animateValueChange {
            gauge.animateRate(1, newValue: viewModel.value) { _ in
                if let completion = completion {
                    completion()
                }
            }
        } else {
            gauge.rate = viewModel.value
        }
    }
}

// MARK: - Private methods
private extension GaugeInfoView {
    func setupView() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubview(wrapperView)
        wrapperView.addSubviews(gauge, valueLabel, infoLabel)
    }

    func setupConstraints() {
        wrapperView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(insets)
        }
        gauge.snp.makeConstraints {
            $0.width.equalToSuperview()
                .priority(.required)
            $0.aspectRatio(.squared(1), inView: gauge)
            $0.left.top.right.equalToSuperview()
            bottomGaugeConstraint = $0.bottom.equalToSuperview()
                .priority(.required)
                .constraint
        }
        bottomGaugeConstraint.isActive = false
        valueLabel.snp.makeConstraints {
            $0.center.equalTo(gauge)
            $0.height.width.equalToSuperview()
                .inset(Constants.gaugeLineWidth)
        }
        infoLabel.snp.makeConstraints {
            topLabelConstraint = $0.top.equalTo(gauge.snp.bottom)
                .offset(UIConstants.spacing10)
                .priority(.required)
                .constraint
            $0.left.bottom.right.equalToSuperview()
        }
    }
}

// MARK: - Constants
private extension GaugeInfoView {
    enum Constants {
        static let gaugeLineWidth: CGFloat = 16
    }
}
