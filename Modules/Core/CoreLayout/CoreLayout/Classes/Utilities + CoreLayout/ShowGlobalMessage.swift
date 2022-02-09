//
//  ShowGlobalMessage.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/1/22.
//

import SharedUtilities

// sourcery: AutoMockable
public protocol ShowGlobalMessageProtocol {
    func showWarning(
        warningMessage: String,
        buttonTitle: String,
        buttonHandler: @escaping ((UIButton) -> Void)
    )
    func showSuccess(successMessage: String)
    func showError(error: Error)
    func showError(errorMessage: String)
    func showWarning(warningMessage: String)
}

struct ShowGlobalMessage {}

extension ShowGlobalMessage: ShowGlobalMessageProtocol {
    public func showError(error: Error) {
        let errorMessage = ErrorMapper.map(error: error)
        showError(errorMessage: errorMessage)
    }

    public func showError(errorMessage: String) {
        UIViewController.showBanner(
            viewModel: .default(body: errorMessage),
            theme: .error,
            buttonHandler: nil
        )
    }

    public func showWarning(warningMessage: String) {
        UIViewController.showBanner(
            viewModel: .default(body: warningMessage),
            theme: .warning,
            buttonHandler: nil
        )
    }

    public func showWarning(
        warningMessage: String,
        buttonTitle: String,
        buttonHandler: @escaping ((UIButton) -> Void)
    ) {
        UIViewController.showBanner(viewModel: .init(title: warningMessage,
                                                     body: nil,
                                                     iconImage: nil,
                                                     iconText: nil,
                                                     buttonImage: nil,
                                                     buttonTitle: buttonTitle),
                                    theme: .warning,
                                    buttonHandler: buttonHandler)
    }
    
    public func showSuccess(successMessage: String) {
        UIViewController.showBanner(
            viewModel: .default(body: successMessage),
            theme: .success,
            buttonHandler: nil
        )
    }
}
