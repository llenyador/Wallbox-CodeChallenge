//
//  UIStackView + Additions.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 18/11/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach { (subview) in
            addArrangedSubview(subview)
        }
    }
    
    @discardableResult
    func addArrangedSubviewInContainerView(_ subview: UIView,
                                           padding: UIEdgeInsets = .zero) -> UIView {
        let containerView = UIView()
        containerView.addSubview(subview)
        subview.anchor(top: containerView.topAnchor,
                       left: containerView.leftAnchor,
                       bottom: containerView.bottomAnchor,
                       right: containerView.rightAnchor,
                       topConstant: padding.top,
                       leftConstant: padding.left,
                       bottomConstant: padding.bottom,
                       rightConstant: padding.right)
        addArrangedSubview(containerView)
        return containerView
    }
}
