//
//  HistoricalPlotsViewControllerTests.swift
//
//  Created by Aitor Salvador on 14/2/22.
//

import XCTest
import SwiftyMocky
@testable import CoreLayout
@testable import SharedTestingUtilities
@testable import EMSDisplay

final class HistoricalPlotsViewControllerTests: XCTestCase {
    private var view: HistoricalPlotsView!
    private var viewController: HistoricalPlotsViewController!
    private var interactorMock: HistoricalPlotsInteractorProtocolMock!

    // // MARK: - Test lifecycle
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

    // MARK: - Tests
    func testViewDidLoad() {
        viewController.viewDidLoad()
        interactorMock.verifyOnce(.viewDidLoad())
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

private extension HistoricalPlotsViewControllerTests {
    func setupDependencies() {
        interactorMock = .init()
        view = .init()
        viewController = .init(view: view)
        _ = UINavigationController(rootViewController: viewController)
        viewController.interactor = interactorMock
    }
}
