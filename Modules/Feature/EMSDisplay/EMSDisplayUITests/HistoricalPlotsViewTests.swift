//
//  HistoricalPlotsViewTests.swift
//  EMSDisplay-Unit-EMSDisplayUITests
//
//  Created by Aitor Salvador on 16/2/22.
//

import XCTest
@testable import EMSDisplay
@testable import EMSDomain
@testable import CoreLayoutTestingUtilities
@testable import SharedTestingUtilities
@testable import EMSDisplayMocks

final class HistoricalPlotsViewsTests: SnapshotTestCase {
    private var viewController: HistoricalPlotsViewController!
    private var navigationController: UINavigationController!
    private var view: HistoricalPlotsView!

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        viewController = nil
        navigationController = nil
        view = nil
        UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController = nil
    }

    func testViewWithQuasarsSupplying() throws {
        var samplesTime = Date.distantPast
        let data: [HistoricalData] = Array(0...10).map { index in
            let doubleValue = index.doubleValue
            return HistoricalData(
                buildingActivePower: .init(1 + doubleValue),
                gridActivePower: .init(2 + doubleValue),
                pvActivePower: .init(3 + doubleValue),
                quasarsActivePowerStatus: .supplyingEnergy(
                    .init(4 + doubleValue)
                ),
                timestamp: advancingHalfAnHour(&samplesTime)
            )
        }
        let viewModel = try HistoricalDataToLineChartModelMapper.map(data)
        viewController.display(state: .showData(viewModel))
        assertSnapshots(for: navigationController,
                                         asyncWaitTime: 0.3)
    }

    func testError() {
        let errorMessage = "Test error"
        viewController.display(state: .error(message: errorMessage))
        assertSnapshots(for: navigationController, asyncWaitTime: nil)
    }

    func testLoading() {
        viewController.display(state: .loading)
        assertSnapshots(for: navigationController, asyncWaitTime: 0.01)
    }
}

private extension HistoricalPlotsViewsTests {
    func setupDependencies() {
        view = .init()
        viewController = .init(view: view)
        viewController.interactor = HistoricalPlotsInteractorProtocolMock()
        navigationController = .init(rootViewController: viewController)

        navigationController.loadViewIfNeeded()
        viewController.loadViewIfNeeded()
        
        UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController = navigationController
    }
}
