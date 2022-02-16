//
//  XCTestCase+SnapshotTesting.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 15/2/22.
//

import SnapshotTesting
import SharedUtilities
import XCTest

public extension XCTestCase {
    func launchSnapshot(for vc: UIViewController,
                        customHeight: CGFloat? = nil,
                        file: StaticString = #file,
                        testName: String = #function,
                        line: UInt = #line) {

        var device = [
            ViewImageConfig.iPhoneX,
            ViewImageConfig.iPhone8
        ]

        if let customHeight = customHeight {
            let width = UIScreen.main.bounds.size.width
            device.append(
                ViewImageConfig(
                    safeArea: .zero,
                    size: CGSize(width: width,
                                 height: customHeight),
                    traits: .init()
                )
            )
        }

        device.forEach {
            assertSnapshot(
                matching: vc,
                as: .image(on: $0),
                file: file,
                testName: testName,
                line: line
            )
        }
    }
}



/// Snapshot test case
open class SnapshotTestCase: XCTestCase {
    public typealias SnapshottingDevice = Snapshotting<UIViewController, UIImage>

    // MARK: - Constants
    public var isRecording = false

    // MARK: - Set up

    /// Sets up dependencies
    open override class func setUp() {
        super.setUp()
    }

    open override func setUp() {
        super.setUp()
    }

    // MARK: - Snapshots

    /// Asserts snapshots for given UIViewController instance
    /// - Parameters:
    ///   - viewController: UIViewController instance to take snapshots for
    ///   - config: Snapshot configuration
    ///   - name: Snapshot name (or default if nil)
    ///   - recording: Whether the snapshot must be recorded again or not
    ///   - timeout: Snapshot timeout
    ///   - file: Snapshot file name
    ///   - testName: Snapshot test name
    ///   - line: Snapshot line
    public func assertSnapshots(
        for viewController: UIViewController,
        asyncWaitTime waitingTime: TimeInterval?,
        as config: [SnapshottingDevice] = [
            .image(on: .iPhoneXr),
            .image(on: .iPhone8)
        ],
        named name: String? = nil,
        record recording: Bool = false,
        timeout: TimeInterval = 5,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line,
        waitFor duration: TimeInterval? = nil) {
        let devices = mapDevices(config, by: duration)

        devices.forEach {
            var strategy: Snapshotting<UIViewController, UIImage>
            if let waitingTime = waitingTime {
                strategy = .wait(for: waitingTime, on: $0)
            } else {
                strategy = $0
            }
            let failure = verifySnapshot(
                matching: viewController,
                as: strategy,
                named: name,
                record: recording || isRecording,
                timeout: timeout,
                file: file,
                testName: testName,
                line: line
            )
            guard let message = failure else { return }
            XCTFail(message, file: file, line: line)
        }
    }

    func assertSnapshots(
        ofScrollView scrollView: UIScrollView,
        in vc: UIViewController,
        asyncWaitTime waitingTime: TimeInterval?,
        as config: [ViewImageConfig] = [
            .iPhoneXr,
            .iPhone8
        ],
        fixedHeight: CGFloat? = nil,
        additionalHeight: CGFloat = 0,
        named name: String? = nil,
        record recording: Bool = false,
        timeout: TimeInterval = 5,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        config.forEach {
            let viewConfig = $0
            vc.view.bounds.size = viewConfig.size.orZero
            vc.view.layoutIfNeeded()
            
            let width = (viewConfig.size?.width).orZero
            
            let extraTop: CGFloat
            if let navC = vc as? UINavigationController {
                extraTop = navC.navigationBar.bounds.size.height
            } else {
                extraTop = (vc.navigationController?.navigationBar.bounds.size.height).orZero
            }

            func scrollViewHeight(_ scrollView: UIScrollView,
                                  in viewConfig: ViewImageConfig) -> CGFloat {
                scrollView.contentSize.height + scrollView.contentInset.top + scrollView.contentInset.bottom + viewConfig.safeArea.top + viewConfig.safeArea.bottom
            }

            let height = fixedHeight ?? (scrollViewHeight(scrollView, in: viewConfig) + extraTop)
            let size = CGSize(width: width, height: height + additionalHeight)
            
            let vcStrategy: Snapshotting<UIViewController, UIImage> = .image(
                on: .init(
                    safeArea: .zero,
                    size: size,
                    traits: .init()
                )
            )
            var strategy: Snapshotting<UIViewController, UIImage>
            if let waitingTime = waitingTime {
                strategy = .wait(for: waitingTime, on: vcStrategy)
            } else {
                strategy = vcStrategy
            }
            let failure = verifySnapshot(
                matching: vc,
                as: strategy,
                named: name,
                record: recording || isRecording,
                file: file,
                testName: testName,
                line: line
            )
            guard let message = failure else {
                return
            }
            XCTFail(message, file: file, line: line)
        }
    }
}

// MARK: - Default extensions
public extension SnapshotTestCase {
    func assertSnapshotsOfFirstScrollView(
        in navigationController: UINavigationController,
        asyncWaitTime: TimeInterval?,
        file: StaticString = #file,
        line: UInt = #line,
        testName: String = #function
    ) {
        let firstVC = navigationController.viewControllers.first
        guard let scrollView = firstVC?.viewOfType(UIScrollView.self) else {
            return XCTFail("Could not find scrollView in \(navigationController)",
                           file: file,
                           line: line)
        }
        assertSnapshots(ofScrollView: scrollView,
                        in: navigationController,
                        asyncWaitTime: asyncWaitTime,
                        file: file,
                        testName: testName,
                        line: line)
    }
}

private extension SnapshotTestCase {
    func mapDevices(_ devices: [SnapshottingDevice], by duration: TimeInterval?) -> [SnapshottingDevice] {
        devices.map { item in
            if let duration = duration {
                return .wait(for: duration, on: item)
            } else {
                return item
            }
        }
    }
}
