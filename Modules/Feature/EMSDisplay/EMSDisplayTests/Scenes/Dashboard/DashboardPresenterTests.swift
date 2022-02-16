//
//  DashboardPresenterTests.swift
//  EMSDisplay
//
//  Created by Aitor Salvador on 13/2/22.

import XCTest
import SwiftyMocky
@testable import CoreLayoutMocks
@testable import SharedTestingUtilities
@testable import EMSDisplay

final class DashboardPresenterTests: XCTestCase {
    private var presenter: DashboardPresenter!
    private var viewControllerMock: DashboardViewControllerProtocolMock!
    private var showGlobalMessageMock: ShowGlobalMessageProtocolMock!

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

    func testPresentError() {
        let expectedError = TestError.error1
        let expectedErrorMessage = ErrorMapper.map(error: expectedError)

        presenter.present(error: expectedError)
        showGlobalMessageMock.verify(
            .showError(errorMessage: .value(expectedErrorMessage)),
            count: .once
        )
        let state: DashboardModels.ViewState = .error(message: "dashboard_generic_error".localized)
        viewControllerMock.verifyOnce(.display(state: .value(state)))
    }

    func testShowData() throws {
        let data = DashboardModels.Data.any
        let expectedVM = try DashboardViewModelMapper.map(data)

        presenter.present(data: data)

        let state: DashboardModels.ViewState = .showData(expectedVM)
        viewControllerMock.verifyOnce(
            .display(state: .value(state))
        )
    }

    func testShowLoading() {
        presenter.presentLoading()
        viewControllerMock.verifyOnce(.display(state: .value(.loading)))
    }
}

private extension DashboardPresenterTests {
    func setupDependencies() {
        viewControllerMock = .init()
        showGlobalMessageMock = .init()
        presenter = .init(
            viewController: viewControllerMock,
            globalMessage: showGlobalMessageMock
        )
    }
}
