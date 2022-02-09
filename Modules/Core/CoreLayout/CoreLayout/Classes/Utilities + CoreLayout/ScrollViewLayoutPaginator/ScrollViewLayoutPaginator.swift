//
//  ScrollViewLayoutPaginator.swift
//  CoreLayout
//
//  Created by Aitor Salvador García on 31/08/2020.
//

import SharedUtilities

public class ScrollViewLayoutPaginator {
    private let configuration: ScrollViewLayoutPaginatorModels.Configuration
    private weak var delegate: ScrollViewLayoutPaginatorDelegate?

    public init(configuration: ScrollViewLayoutPaginatorModels.Configuration,
                delegate: ScrollViewLayoutPaginatorDelegate) {
        self.configuration = configuration
        self.delegate = delegate
    }
}

// MARK: - ScrollViewLayoutPaginatorProtocol
extension ScrollViewLayoutPaginator: ScrollViewLayoutPaginatorProtocol {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didChange(scrollView, contentOffset: scrollView.contentOffset)
    }
}

// MARK: - ScrollViewTrackerDelegate
private extension ScrollViewLayoutPaginator {
    func didChange(_ scrollView: UIScrollView, contentOffset: CGPoint) {
        guard shouldPaginate(for: contentOffset, in: scrollView) else {
            return
        }
        delegate?.scrollViewDidReachBottomThreshold(scrollView)
    }

    func shouldPaginate(for contentOffset: CGPoint,
                        in scrollView: UIScrollView) -> Bool {
        let bounds = scrollView.bounds
        let contentSize = scrollView.contentSize
        let threshold = configuration.threshold

        switch configuration.tracksDirection {
        case .vertical:
            let bottomEdge = contentOffset.y + bounds.size.height
            guard bottomEdge < contentSize.height else {
                return false
            }
            let thresholdHeight = contentSize.height - threshold
            let isBottomEdgeInThresholdRegion = bottomEdge >= thresholdHeight
            return isBottomEdgeInThresholdRegion
        case .horizontal:
            let rightEdge = contentOffset.x + bounds.size.width
            guard rightEdge < contentSize.width else {
                return false
            }
            let thresholdWidth = contentSize.width - threshold
            let isRightEdgeInThresholdRegion = rightEdge >= thresholdWidth
            return isRightEdgeInThresholdRegion
        }
    }
}
