//
//  LiveSessionView.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/2/22.
//

import CoreLayout
import UIKit

final class LiveSessionView: UIView {
    let titleLabel = Init(UILabel()) {
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 16)
    }
    let separatorView = Init(UIView()) {
        $0.backgroundColor = .white
    }
    let horizontalStack = Init(UIStackView()) {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    let sourcePower1LabelsStack = Init(VerticalLabelsStack()) {
        $0.topLabel.font = .systemFont(ofSize: 14)
        $0.bottomLabel.font = .boldSystemFont(ofSize: 16)
        $0.topLabel.textAlignment = .center
        $0.bottomLabel.textAlignment = .center
        $0.backgroundColor = .primary
    }
    let sourcePower2LabelsStack = Init(VerticalLabelsStack()) {
        $0.topLabel.font = .systemFont(ofSize: 14)
        $0.bottomLabel.font = .boldSystemFont(ofSize: 16)
        $0.topLabel.textAlignment = .center
        $0.bottomLabel.textAlignment = .center
        $0.backgroundColor = .primary
    }
    let sourcePower3LabelsStack = Init(VerticalLabelsStack()) {
        $0.topLabel.font = .systemFont(ofSize: 14)
        $0.bottomLabel.font = .boldSystemFont(ofSize: 16)
        $0.topLabel.textAlignment = .center
        $0.bottomLabel.textAlignment = .center
        $0.backgroundColor = .primary
    }
    let totalPowerLabelsStack = Init(VerticalLabelsStack()) {
        $0.topLabel.font = .systemFont(ofSize: 14)
        $0.bottomLabel.font = .boldSystemFont(ofSize: 16)
        $0.topLabel.textAlignment = .center
        $0.bottomLabel.textAlignment = .center
        $0.backgroundColor = .primary
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LiveSessionView {
    func display(viewModel: LiveSessionViewViewModel) {
        titleLabel.text = viewModel.titleText
        sourcePower1LabelsStack.isHidden = viewModel.sourcePower1VM.isNil
        if let sourcePower1VM = viewModel.sourcePower1VM {
            sourcePower1LabelsStack.display(viewModel: sourcePower1VM)
        }
        sourcePower2LabelsStack.isHidden = viewModel.sourcePower2VM.isNil
        if let sourcePower2VM = viewModel.sourcePower2VM {
            sourcePower2LabelsStack.display(viewModel: sourcePower2VM)
        }
        sourcePower3LabelsStack.isHidden = viewModel.sourcePower3VM.isNil
        if let sourcePower3VM = viewModel.sourcePower3VM {
            sourcePower3LabelsStack.display(viewModel: sourcePower3VM)
        }
        totalPowerLabelsStack.display(viewModel: viewModel.totalPowerVM)
    }
}

private extension LiveSessionView {
    func setupView() {
        backgroundColor = .primary
        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubviews(
            titleLabel,
            separatorView,
            horizontalStack,
            totalPowerLabelsStack
        )
        horizontalStack.addArrangedSubviews(
            sourcePower1LabelsStack,
            sourcePower2LabelsStack,
            sourcePower3LabelsStack
        )
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(UIConstants.spacing10)
            $0.left.equalToSuperview()
                .offset(UIConstants.hMargin)
            $0.right.lessThanOrEqualToSuperview()
                .inset(UIConstants.hMargin)
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
        }
        horizontalStack.spacing = UIConstants.spacing2

        totalPowerLabelsStack.snp.makeConstraints {
            $0.top.equalTo(horizontalStack.snp.bottom)
                .offset(UIConstants.spacing6)
            $0.centerHorizontallyToSuperview()
            $0.bottom.equalToSuperview()
                .inset(UIConstants.spacing10)
        }
    }
}
