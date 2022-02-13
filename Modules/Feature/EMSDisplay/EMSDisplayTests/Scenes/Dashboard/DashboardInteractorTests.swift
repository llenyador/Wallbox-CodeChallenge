//
//  DashboardInteractorTests.swift
//
//  Created by Aitor Salvador on 13/2/22.
//

import XCTest
import SwiftyMocky
import Combine
@testable import SharedTestingUtilities
@testable import EMSDisplay

final class DashboardInteractorTests: XCTestCase {
    private var interactor: DashboardInteractor<TestSchedulerOf<DispatchQueue>>!
    private var presenterMock: DashboardPresenterProtocolMock!
    private var routerMock: DashboardRouterProtocolMock!
    private var workerMock: DashboardWorkerProtocolMock!
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
    }

    // MARK: - Tests
    func testViewDidLoadSuccess() throws {
        let expectedOutput = DashboardModels.Data.any
        let publisher = scheduler.scheduleSuccessPublisher(atVirtualTime: 1,
                                                           returnedData: expectedOutput)

        workerMock.given(.getLiveData(willReturn: publisher))

        interactor.viewDidLoad()

        scheduler.advance(by: 1)

        workerMock.verifyOnce(.getLiveData())
        presenterMock.verifyOnce(.present(data: .value(expectedOutput)))
        presenterMock.verifyOnce(.presentLoading())
    }

    func testViewDidLoadFailure() {
        let expectedError = TestError.error1
        let publisher = scheduler.scheduleErrorPublisher(
            atVirtualTime: 1,
            dataType: DashboardModels.Data.self,
            error: expectedError
        )

        workerMock.given(.getLiveData(willReturn: publisher))

        interactor.viewDidLoad()

        scheduler.advance(by: 1)

        workerMock.verifyOnce(.getLiveData())
        presenterMock.verifyOnce(.present(error: .value(expectedError)))
    }
}

private extension DashboardInteractorTests {
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

extension TestSchedulerOf {
    func scheduleSuccessPublisher<Data>(atVirtualTime time: SchedulerTimeType.Stride,
                                        returnedData: Data) -> PublisherResult<Data> {
        FutureResult { callback in
            self.schedule(after: self.now.advanced(by: time)) {
                callback(.success(returnedData))
            }
        }.eraseToAnyPublisher()
    }

    func scheduleErrorPublisher<Data>(
        atVirtualTime time: SchedulerTimeType.Stride,
        dataType: Data.Type,
        error: Error
    ) -> PublisherResult<Data> {
        FutureResult { callback in
            self.schedule(after: self.now.advanced(by: time)) {
                callback(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
