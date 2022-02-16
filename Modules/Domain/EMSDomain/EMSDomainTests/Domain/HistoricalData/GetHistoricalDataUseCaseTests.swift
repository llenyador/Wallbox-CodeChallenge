//
//  GetHistoricalDataUseCaseTests.swift
//  EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SwiftyMocky
@testable import SharedTestingUtilities
@testable import EMSDomain

final class GetHistoricalDataUseCaseTests: XCTestCase {
    private var useCase: GetHistoricalDataUseCase!
    private var repositoryMock: HistoricalDataDataRepositoryProtocolMock!

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()
        repositoryMock = nil
        useCase = nil
    }

    func testSuccess() throws {
        let expectedOutput: [HistoricalData] = .any(length: 4)
        repositoryMock.given(
            .getHistoricalData(willReturn: .just(expectedOutput))
        )

        let publisher = useCase.execute()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)

        repositoryMock.verifyOnce(.getHistoricalData())
    }

    func testViewDidLoadFailure() throws {
        let expectedError = TestError.error1
        repositoryMock.given(
            .getHistoricalData(willReturn: .failure(error: expectedError))
        )

        let publisher = useCase.execute()
        let optionalError = try waitForPublisherError(publisher)
        assertError(optionalError, isEqualToExpectedError: expectedError)

        repositoryMock.verifyOnce(.getHistoricalData())
    }
}

// MARK: Private methods
private extension GetHistoricalDataUseCaseTests {
    func setupDependencies() {
        repositoryMock = .init()
        useCase = .init(dataRepository: repositoryMock)
    }
}
