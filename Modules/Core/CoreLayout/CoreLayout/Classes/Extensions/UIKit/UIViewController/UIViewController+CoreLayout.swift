//
//  UIViewController + Additions.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 18/11/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import UIKit

public extension UIViewController {
    func disableLargeTitles() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    func enableLargeTitles() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        }
    }
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func animateConstraintChange(constraint: NSLayoutConstraint,
                                 constant: CGFloat,
                                 duration: Double = 0.2,
                                 onAnimation: (() -> Void)? = nil) {
        view.layoutIfNeeded()
        UIView.animate(withDuration: duration) { [weak self] in
            self?.view.layoutIfNeeded()
            constraint.constant = constant
            onAnimation?()
        }
    }
}

// MARK: - Child View Controllers
public extension UIViewController {
    func addChildViewController(_ childViewController: UIViewController, inView containerView: UIView?) {
        addChild(childViewController)
        if let containerView = containerView {
            containerView.embedSubview(childViewController.view)
        }
        childViewController.didMove(toParent: self)
    }
    
    func removeFromParentViewController() {
        willMove(toParent: nil)
        removeFromParent()
    }
}

// MARK: - Dismiss Keyboard on tap

public extension UIViewController {
    func hideKeyboardWhenTappedAround(ofView tappedView: UIView? = nil) {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        if let tappedView = tappedView {
            tappedView.addGestureRecognizer(tap)
        } else {
            view.addGestureRecognizer(tap)
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Constraints Programmatically

public extension UIViewController {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.topAnchor
        } else {
            return topLayoutGuide.bottomAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomLayoutGuide.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.leftAnchor
        } else {
            return view.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.rightAnchor
        } else {
            return view.rightAnchor
        }
    }
}
