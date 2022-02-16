//
//  VerticalLabelsStack.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/2/22.
//

public final class VerticalLabelsStack: UIView {
    public let topLabel = Init(UILabel()) {
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    public let bottomLabel = Init(UILabel()) {
        $0.textColor = .white
        $0.numberOfLines = 0
    }

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension VerticalLabelsStack {
    public func display(viewModel: VerticalLabelsStackViewModel) {
        topLabel.text = viewModel.topText
        bottomLabel.text = viewModel.bottomText
    }
}

// MARK: - Private methods
private extension VerticalLabelsStack {
    func setupView() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubviews(topLabel, bottomLabel)
    }

    func setupConstraints() {
        topLabel.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
        bottomLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(topLabel.snp.bottom)
                .offset(UIConstants.spacing4)
            $0.left.bottom.right
                .equalToSuperview()
        }
    }
}
