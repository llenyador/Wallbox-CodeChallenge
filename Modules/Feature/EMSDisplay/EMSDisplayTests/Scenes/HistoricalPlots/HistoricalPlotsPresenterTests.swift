//
//  HistoricalPlotsPresenterTests.swift
//
//  Created by Aitor Salvador on 14/2/22.
//

import XCTest
import SwiftyMocky
@testable import CoreLayoutMocks
@testable import SharedTestingUtilities
@testable import EMSDisplay
@testable import EMSDomain

final class HistoricalPlotsPresenterTests: XCTestCase {
    private var presenter: HistoricalPlotsPresenter!
    private var viewControllerMock: HistoricalPlotsViewControllerProtocolMock!
    private var showGlobalMessageMock: ShowGlobalMessageProtocolMock!

    // // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()
        presenter = nil
        viewControllerMock = nil
        showGlobalMessageMock = nil
    }
    
    // MARK: Tests
    func testPresentError() {
        let expectedError = TestError.error1
        let expectedErrorMessage = ErrorMapper.map(error: expectedError)

        presenter.present(error: expectedError)
        showGlobalMessageMock.verify(
            .showError(errorMessage: .value(expectedErrorMessage)),
            count: .once
        )
        let state: HistoricalPlotsModels.ViewState = .error(message: "dashboard_generic_error".localized)
        viewControllerMock.verifyOnce(.display(state: .value(state)))
    }

    func testShowData() throws {
        let data = [HistoricalData].any(length: 1)
        let expectedVM = try HistoricalDataToLineChartModelMapper.map(data)

        presenter.present(data: data)

        let state: HistoricalPlotsModels.ViewState = .showData(expectedVM)
        viewControllerMock.verifyOnce(
            .display(state: .value(state))
        )
    }

    func testShowLoading() {
        presenter.presentLoading()
        viewControllerMock.verifyOnce(.display(state: .value(.loading)))
    }
}

private extension HistoricalPlotsPresenterTests {
    func setupDependencies() {
        viewControllerMock = .init()
        showGlobalMessageMock = .init()
        presenter = .init(
            viewController: viewControllerMock,
            globalMessage: showGlobalMessageMock
        )
    }
}
