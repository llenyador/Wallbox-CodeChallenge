//
//  DashboardViewsTests.swift
//  AppUITests
//
//  Created by Aitor Salvador on 15/2/22.
//

import XCTest
@testable import EMSDisplay
@testable import EMSDomain
@testable import CoreLayoutTestingUtilities
@testable import EMSDisplayMocks

final class DashboardViewsTests: SnapshotTestCase {
    private var viewController: DashboardViewController!
    private var navigationController: UINavigationController!
    private var view: DashboardView!

    override func setUp() {
        super.setUp()
        isRecording = true
        setupDependencies()
    }

    override func tearDown() {
        viewController = nil
        navigationController = nil
        view = nil
        UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController = nil
    }

    func testViewWithQuasarsSupplying() throws {
        let data = DashboardModels.Data.mock(quasarsStatus: .supplyingEnergy(
            .init(
                power: 20,
                suppliedPercentage: 20
            )
        ))
        let viewModel = try DashboardViewModelMapper.map(data)
        viewController.display(state: .showData(viewModel))
        assertSnapshotsOfFirstScrollView(in: navigationController,
                                         asyncWaitTime: 1)
    }

    func testViewWithQuasarsConsuming() throws {
        let data = DashboardModels.Data.mock(quasarsStatus: .consumingEnergy)
        let viewModel = try DashboardViewModelMapper.map(data)
        viewController.display(state: .showData(viewModel))
        assertSnapshotsOfFirstScrollView(in: navigationController,
                                         asyncWaitTime: 1)
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

private extension DashboardViewsTests {
    func setupDependencies() {
        view = .init()
        viewController = .init(view: view)
        viewController.interactor = DashboardInteractorProtocolMock()
        navigationController = .init(rootViewController: viewController)

        navigationController.loadViewIfNeeded()
        viewController.loadViewIfNeeded()
        
        UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController = navigationController
    }
}

private extension DashboardModels.Data {
    static func mock(quasarsStatus: DashboardModels.DashboardQuasarStatus) -> Self {
        .init(
            quasarsEnergyResume: .init(
                consumedEnergy: 60,
                suppliedEnergy: 140,
                suppliedEnergyPercentage: 30,
                consumedEnergyPercentage: 70
            ),
            liveData: .init(
                quasarStatus: quasarsStatus,
                solarPower: .init(
                    power: 10,
                    suppliedPercentage: 10
                ),
                gridPower: .init(
                    power: 70,
                    suppliedPercentage: 70
                ),
                buildingDemandPower: 100
            )
        )
    }
}
