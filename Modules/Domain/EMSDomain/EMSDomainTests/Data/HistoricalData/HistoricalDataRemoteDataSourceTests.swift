//
//  HistoricalDataRemoteDataSourceTests.swift
//  EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SwiftyMocky
@testable import SharedTestingUtilities
@testable import EMSDomain

final class HistoricalDataRemoteDataSourceTests: XCTestCase {
    private var dataSource: HistoricalDataRemoteDataSource!
    private var networkClientMock: NetworkClientProtocolMock!

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()
        networkClientMock = nil
        dataSource = nil
    }

    func testSuccess() throws {
        let expectedOutput = [HistoricalData].any(length: 4)
        let endpoint = Endpoint.HistoricalData.getHistoricalData
        networkClientMock.given(
            .perform(
                endpoint: .value(endpoint),
                arrayMapper: .any(HistoricalDataDTOToHistoricalDataMapper.Type.self),
                waitsUntilConnected: .value(false),
                willReturn: .just(expectedOutput)
            )
        )
        
        let publisher = dataSource.getHistoricalData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedOutput)
        
        networkClientMock.verifyOnce(
            .perform(
                endpoint: .value(endpoint),
                arrayMapper: .any(HistoricalDataDTOToHistoricalDataMapper.Type.self),
                waitsUntilConnected: .value(false)
            )
        )
    }

    func testFailure()  throws {
        let expectedError = TestError.error1
        let endpoint = Endpoint.HistoricalData.getHistoricalData
        networkClientMock.given(
            .perform(
                endpoint: .value(endpoint),
                arrayMapper: .any(HistoricalDataDTOToHistoricalDataMapper.Type.self),
                waitsUntilConnected: .value(false),
                willReturn: .failure(error: expectedError)
            )
        )
        
        let publisher = dataSource.getHistoricalData()
        let optionalError = try waitForPublisherError(publisher)
        assertError(optionalError,
                    isEqualToExpectedError: expectedError)
        
        networkClientMock.verifyOnce(
            .perform(
                endpoint: .value(endpoint),
                arrayMapper: .any(HistoricalDataDTOToHistoricalDataMapper.Type.self),
                waitsUntilConnected: .value(false)
            )
        )
    }
}

private extension HistoricalDataRemoteDataSourceTests {
    func setupDependencies() {
        networkClientMock = .init()
        dataSource = .init(networkClient: networkClientMock)

        Matcher.default.register(EndpointProtocol.self) { lhs, rhs in
            guard let lhs = lhs as? Endpoint.HistoricalData,
                  let rhs = rhs as? Endpoint.HistoricalData else {
                      return false
                  }
            switch (lhs, rhs) {
            case (.getHistoricalData, .getHistoricalData):
                return lhs == rhs
            }
        }
    }
}
