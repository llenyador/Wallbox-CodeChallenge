//
//  UIViewController + SwiftMessages.swift
//  CoreLayout
//
//  Created by Aitor Salvador García on 31/01/2021.
//

import SwiftMessages
import SharedUtilities

public struct BannerViewModel {
    public let title: String?
    public let body: String?
    public let iconImage: UIImage?
    public let iconText: String?
    public let buttonImage: UIImage?
    public let buttonTitle: String?
    
    public init(
        title: String?,
        body: String?,
        iconImage: UIImage?,
        iconText: String?,
        buttonImage: UIImage?,
        buttonTitle: String?
    ) {
        self.title = title
        self.body = body
        self.iconImage = iconImage
        self.iconText = iconText
        self.buttonImage = buttonImage
        self.buttonTitle = buttonTitle
    }
    
    static func `default`(body: String) -> Self {
        .init(title: nil,
              body: body,
              iconImage: nil,
              iconText: nil,
              buttonImage: nil,
              buttonTitle: nil)
    }
}

public extension UIViewController {
    func showBanner(viewModel: BannerViewModel,
                    theme: Theme,
                    buttonHandler: ((UIButton) -> Void)?) {
        Self.showBanner(viewModel: viewModel,
                        theme: theme,
                        buttonHandler: buttonHandler)
    }

    static func showBanner(viewModel: BannerViewModel,
                           theme: Theme,
                           buttonHandler: ((UIButton) -> Void)?) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureDropShadow()
        
        view.configureContent(title: viewModel.title,
                              body: viewModel.body,
                              iconImage: viewModel.iconImage,
                              iconText: viewModel.iconText,
                              buttonImage: viewModel.buttonImage,
                              buttonTitle: viewModel.buttonTitle,
                              buttonTapHandler: buttonHandler)
        view.button?.isHidden = viewModel.buttonImage.isNil &&
            viewModel.buttonTitle.isNil
        view.titleLabel?.isHidden = viewModel.title.isNil
        view.titleLabel?.numberOfLines = 0
        view.bodyLabel?.isHidden = viewModel.body.isNil
        
        view.configureTheme(theme, iconStyle: .subtle)
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.duration = .seconds(seconds: 5)
        config.preferredStatusBarStyle = .lightContent
        config.presentationContext = .window(windowLevel: .normal)
        
        SwiftMessages.show(config: config, view: view)
    }
}
