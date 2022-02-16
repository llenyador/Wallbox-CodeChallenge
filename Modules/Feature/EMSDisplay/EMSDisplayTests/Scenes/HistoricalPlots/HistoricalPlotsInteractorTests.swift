//
//  HistoricalPlotsInteractorTests.swift
//
//  Created by Aitor Salvador on 14/2/22.
//

import XCTest
import SwiftyMocky
import Combine
@testable import SharedTestingUtilities
@testable import EMSDisplay
@testable import EMSDomain

final class HistoricalPlotsInteractorTests: XCTestCase {
    private var interactor: HistoricalPlotsInteractor<
        TestSchedulerOf<DispatchQueue>
    >!
    private var presenterMock: HistoricalPlotsPresenterProtocolMock!
    private var routerMock: HistoricalPlotsRouterProtocolMock!
    private var workerMock: HistoricalPlotsWorkerProtocolMock!
    private var scheduler: TestSchedulerOf<DispatchQueue>!

    // // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupDependencies()
        Matcher.registerDefaultComparators()
    }

    override func tearDown() {
        super.tearDown()
        interactor = nil
        presenterMock = nil
        routerMock = nil
        workerMock = nil
        scheduler = nil
    }

    // MARK: - Tests
    func testViewDidLoadSuccess() {
        let expectedOutput = [HistoricalData].any()
        let publisher = scheduler.scheduleSuccessPublisher(atVirtualTime: 1,
                                                           returnedData: expectedOutput)

        workerMock.given(.getHistoricalData(willReturn: publisher))

        interactor.viewDidLoad()

        scheduler.advance(by: 1)

        workerMock.verifyOnce(.getHistoricalData())
        presenterMock.verifyOnce(.present(data: .value(expectedOutput)))
        presenterMock.verifyOnce(.presentLoading())
    }

    func testViewDidLoadFailure() {
        let expectedError = TestError.error1
        let publisher = scheduler.scheduleErrorPublisher(
            atVirtualTime: 1,
            dataType: [HistoricalData].self,
            error: expectedError
        )

        workerMock.given(.getHistoricalData(willReturn: publisher))

        interactor.viewDidLoad()

        scheduler.advance(by: 1)

        workerMock.verifyOnce(.getHistoricalData())
        presenterMock.verifyOnce(.present(error: .value(expectedError)))
    }
}

private extension HistoricalPlotsInteractorTests {
    func setupDependencies() {
        presenterMock = .init()
        routerMock = .init()
        workerMock = .init()
        scheduler = DispatchQueue.test
        interactor = .init(
            presenter: presenterMock,
            router: routerMock,
            worker: workerMock,
            scheduler: scheduler
        )
    }
}
