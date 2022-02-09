//
//  ConstraintMaker + CoreLayout.swift
//  
//
//  Created by Aitor Salvador García on 12/7/21.
//

import SnapKit
import CoreGraphics

public extension ConstraintMaker {
    func centerVerticallyToSuperview(inset: CGFloat = 0) {
        top.greaterThanOrEqualToSuperview().offset(inset)
        bottom.lessThanOrEqualToSuperview().inset(inset)
        centerY.equalToSuperview()
    }

    func centerVerticallyToSuperview(topInset: CGFloat = 0,
                                     bottomInset: CGFloat = 0) {
        top.greaterThanOrEqualToSuperview().offset(topInset)
        bottom.lessThanOrEqualToSuperview().inset(bottomInset)
        centerY.equalToSuperview()
    }

    func centerHorizontallyToSuperview(inset: CGFloat = 0) {
        left.greaterThanOrEqualToSuperview().offset(inset)
        right.lessThanOrEqualToSuperview().inset(inset)
        centerX.equalToSuperview()
    }

    @discardableResult
    func aspectRatio(_ size: CGSize, inView view: UIView) -> ConstraintMakerEditable {
        width.equalTo(view.snp.height).multipliedBy(size.width/size.height)
    }
}
