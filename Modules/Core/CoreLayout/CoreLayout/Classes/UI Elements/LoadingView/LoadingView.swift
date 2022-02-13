//
//  LoadingView.swift
//  
//
//  Created by Aitor Salvador García on 8/7/21.
//

import NVActivityIndicatorView

public final class LoadingView: UIView {
    private lazy var view: NVActivityIndicatorView = {
        NVActivityIndicatorView(frame: .init(origin: .zero,
                                             size: Constants.indicatorSize),
                                type: style.nvType,
                                color: style.color,
                                padding: .zero)
    }()

    private let style: LoadingViewStyle
    
    public override var intrinsicContentSize: CGSize {
        Constants.indicatorSize
    }

    public init(style: LoadingViewStyle) {
        self.style = style
        super.init(frame: .zero)

        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension LoadingView {
    func displayAnimating(_ startsLoading: Bool) {
        if startsLoading {
            view.startAnimating()
        } else {
            view.stopAnimating()
        }
        isHidden = !startsLoading
    }
}

private extension LoadingView {
    func setupView() {
        isUserInteractionEnabled = false
        addSubview(view)
        view.anchorsEqualToSuperview()
    }
}

private extension LoadingView {
    enum Constants {
        static let indicatorSize = CGSize(width: 80, height: 35)
    }
}
