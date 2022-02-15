//
//  HistoricalDataDataRepositoryTests.swift
//  EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SwiftyMocky
@testable import SharedTestingUtilities
@testable import EMSDomain

final class HistoricalDataDataRepositoryTests: XCTestCase {
    private var dataRepository: HistoricalDataDataRepository!
    private var remoteDataSourceMock: HistoricalDataRemoteDataSourceProtocolMock!

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()
        dataRepository = nil
        remoteDataSourceMock = nil
    }

    func testGetHistoricalDataSuccess() throws {
        let expectedOutput = [HistoricalData].any(length: 4)
        remoteDataSourceMock.given(
            .getHistoricalData(willReturn: .just(expectedOutput))
        )

        let publisher = dataRepository.getHistoricalData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)
        
        remoteDataSourceMock.verifyOnce(.getHistoricalData())
    }

    func testGetHistoricalDataFailure() throws {
        let expectedError = TestError.error1
        remoteDataSourceMock.given(
            .getHistoricalData(willReturn: .failure(error: expectedError))
        )

        let publisher = dataRepository.getHistoricalData()
        let optionalError = try waitForPublisherError(publisher)
        assertError(optionalError,
                    isEqualToExpectedError: expectedError)
        
        remoteDataSourceMock.verifyOnce(.getHistoricalData())
    }
}

private extension HistoricalDataDataRepositoryTests {
    func setupDependencies() {
        remoteDataSourceMock = .init()
        dataRepository = .init(
            remoteDataSource: remoteDataSourceMock
        )
    }
}
