//
//  UIScrollView + Additions.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 18/11/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import UIKit

public extension UIScrollView {
    func embedContainerVerticalStackView(_ stackView: UIStackView) {
        addSubview(stackView)
        stackView.anchorsEqualToSuperview()
        stackView.equalWidthToSuperView()
        stackView.axis = .vertical
        stackView.spacing = 0
    }
    
    func embedContainerHorizontalStackView(_ stackView: UIStackView) {
        addSubview(stackView)
        stackView.anchorsEqualToSuperview()
        stackView.equalHeightToSuperView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 0
    }
    
    func isBottomEdgeBelowBottomThreshold(_ bottomThreshold: CGFloat) -> Bool {
        let bottomEdge = contentOffset.y + frame.size.height
        let thresholdHeight = contentSize.height - bottomThreshold
        let isBottomEdgeInThresholdRegion = bottomEdge >= thresholdHeight
        return isBottomEdgeInThresholdRegion
    }
    
    func addTopRefreshControl(target: Any, selector: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = .gray
        refreshControl.addTarget(target, action: selector, for: .valueChanged)

        self.refreshControl = refreshControl
    }

    func goHorizontallyTo(page: Int, pageWidth: CGFloat) {
        let contentOffsetX = CGFloat(page) * pageWidth
        let contentOffset = CGPoint(x: contentOffsetX, y: contentOffset.y)
        setContentOffset(contentOffset, animated: true)
    }
}
