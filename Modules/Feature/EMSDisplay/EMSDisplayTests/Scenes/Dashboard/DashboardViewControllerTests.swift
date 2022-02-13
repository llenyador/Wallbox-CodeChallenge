//
//  DashboardViewControllerTests.swift
//  EMSDisplay
//
//  Created by Aitor Salvador on 13/2/22.

import XCTest
import SwiftyMocky
@testable import CoreLayout
@testable import EMSDisplay

final class DashboardViewControllerTests: XCTestCase {
    private var view: DashboardView!
    private var viewController: DashboardViewController!
    private var interactorMock: DashboardInteractorProtocolMock!

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()

        view = nil
        viewController = nil
        interactorMock = nil
    }

    func testViewDidLoad() {
        viewController.viewDidLoad()
        interactorMock.verifyOnce(.viewDidLoad())
        XCTAssertTrue(view.delegate === viewController)
    }

    func testDidTapLiveStatsView() {
        viewController.didTapLiveStatsView()
        interactorMock.verifyOnce(.didTapLiveStatsView())
    }

    func testShowDataStatus() {
        viewController.display(state: .showData(.any))

        XCTAssertTrue(view.loadingView.isHidden)
        XCTAssertTrue(view.errorLabel.isHidden)
        XCTAssertFalse(view.scrollView.isHidden)
    }

    func testShowLoadingStatus() {
        viewController.display(state: .loading)

        XCTAssertTrue(view.scrollView.isHidden)
        XCTAssertTrue(view.errorLabel.isHidden)
        XCTAssertFalse(view.loadingView.isHidden)
    }

    func testErrorStatus() {
        viewController.display(state: .error(message: .any))

        XCTAssertTrue(view.scrollView.isHidden)
        XCTAssertTrue(view.loadingView.isHidden)
        XCTAssertFalse(view.errorLabel.isHidden)
    }
}

private extension DashboardViewControllerTests {
    func setupDependencies() {
        interactorMock = .init()
        view = DashboardView()
        viewController = DashboardViewController(view: view)
        _ = UINavigationController(rootViewController: viewController)
        viewController.interactor = interactorMock
    }
}

