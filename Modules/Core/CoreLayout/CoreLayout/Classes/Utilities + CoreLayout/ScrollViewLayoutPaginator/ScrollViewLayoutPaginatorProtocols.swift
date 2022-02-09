//
//  ScrollViewLayoutPaginatorProtocols.swift
//  CoreLayout
//
//  Created by Aitor Salvador García on 31/08/2020.
//

// sourcery: AutoMockable
public protocol ScrollViewLayoutPaginatorDelegate: AnyObject {
    func scrollViewDidReachBottomThreshold(_ scrollView: UIScrollView)
}

// sourcery: AutoMockable
public protocol ScrollViewLayoutPaginatorProtocol {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

public enum ScrollViewLayoutPaginatorModels {
    public enum MotionDirection {
        case vertical
        case horizontal
    }

    public struct Configuration {
        let tracksDirection: MotionDirection

        ///  Represents the distance between the bottom/right visible
        ///  point of scroll view and the end of its content size at
        ///  which the event of scrollViewDidReachBottomThreshold is fired.
        let threshold: CGFloat

        public init(tracksDirection: MotionDirection = .vertical,
                    threshold: CGFloat) {
            self.tracksDirection = tracksDirection
            self.threshold = threshold
        }

        public static var defaultVertical: Self {
            .init(tracksDirection: .vertical,
                  threshold: 400)
        }

        public static var defaultHorizontal: Self {
            .init(tracksDirection: .horizontal,
                  threshold: 400)
        }
    }
}
