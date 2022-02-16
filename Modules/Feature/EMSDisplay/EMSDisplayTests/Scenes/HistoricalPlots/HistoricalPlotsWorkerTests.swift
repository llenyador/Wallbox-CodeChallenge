//
//  HistoricalPlotsWorkerTests.swift
//
//  Created by Aitor Salvador on 14/2/22.
//

import XCTest
import SwiftyMocky
import Combine
@testable import SharedTestingUtilities
@testable import EMSDisplay
@testable import EMSDomain
@testable import EMSDomainMocks

final class HistoricalPlotsWorkerTests: XCTestCase {
    private var worker: HistoricalPlotsWorker!
    private var getHistoricalDataUseCaseMock: GetHistoricalDataUseCaseProtocolMock!

    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setup()
    }
    
    override func tearDown() {
        super.tearDown()

        worker = nil
        getHistoricalDataUseCaseMock = nil
    }
    
    // MARK: - Tests
    
    func testGetHistoricalDataSuccess() throws {
        let historicalData = [HistoricalData].any()
        getHistoricalDataUseCaseMock.given(
            .execute(willReturn: .just(historicalData))
        )

        let publisher = worker.getHistoricalData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, historicalData)
        getHistoricalDataUseCaseMock.verifyOnce(.execute())
    }

    func testGetHistoricalDataError() throws {
        let error = TestError.error1
        getHistoricalDataUseCaseMock.given(
            .execute(willReturn: .failure(error: error))
        )

        let publisher = worker.getHistoricalData()
        let outputError = try waitForPublisherError(publisher)
        assertError(outputError, isEqualToExpectedError: error)
        getHistoricalDataUseCaseMock.verifyOnce(.execute())
    }
}

private extension HistoricalPlotsWorkerTests {
    func setup() {
        getHistoricalDataUseCaseMock = .init()
        worker = .init(
            getHistoricalDataUseCase: getHistoricalDataUseCaseMock
        )
    }
}
