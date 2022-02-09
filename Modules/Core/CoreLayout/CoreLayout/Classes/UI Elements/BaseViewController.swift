//
//  BaseViewController.swift
//  Books
//
//  Created by Aitor Salvador on 1/1/22.
//

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

private extension BaseViewController {
    func setupNavigationBar() {
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        }
        let arrowImage = UIImage.systemIconImage(
            .arrowLeft,
            tintColor: .blackTextMediumEmphasis
        )
        navigationController?.navigationBar.backIndicatorImage = arrowImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = arrowImage

        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }

    @objc
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
