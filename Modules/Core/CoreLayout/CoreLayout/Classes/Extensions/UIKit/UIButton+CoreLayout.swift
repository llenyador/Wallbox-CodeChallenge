//
//  UIButton+CoreLayout.swift
//  PlayerKit
//
//  Created by Aitor Salvador on 14/1/22.
//

public extension UIButton {
    func makeImageToFill(
        insets: UIEdgeInsets = .all(UIConstants.spacing10)
    ) {
        imageView?.contentMode = .scaleToFill
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        contentEdgeInsets = insets
    }
}
