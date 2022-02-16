//
//  LiveDataRemoteDataSourceTests.swift
//  EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SwiftyMocky
@testable import SharedTestingUtilities
@testable import EMSDomain

final class LiveDataRemoteDataSourceTests: XCTestCase {
    private var dataSource: LiveDataRemoteDataSource!
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
        let expectedLiveData = LiveData.any
        let endpoint = Endpoint.LiveData.getLiveData
        networkClientMock.given(
            .perform(
                endpoint: .value(endpoint),
                mapper: .any(LiveDataDTOToLiveDataMapper.Type.self),
                waitsUntilConnected: .value(false),
                willReturn: .just(expectedLiveData)
            )
        )
        
        let publisher = dataSource.getLiveData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedLiveData)
        
        networkClientMock.verifyOnce(
            .perform(
                endpoint: .value(endpoint),
                mapper: .any(LiveDataDTOToLiveDataMapper.Type.self),
                waitsUntilConnected: .value(false)
            )
        )
    }

    func testFailure()  throws {
        let expectedError = TestError.error1
        let endpoint = Endpoint.LiveData.getLiveData
        networkClientMock.given(
            .perform(
                endpoint: .value(endpoint),
                mapper: .any(LiveDataDTOToLiveDataMapper.Type.self),
                waitsUntilConnected: .value(false),
                willReturn: .failure(error: expectedError)
            )
        )
        
        let publisher = dataSource.getLiveData()
        let optionalError = try waitForPublisherError(publisher)
        assertError(optionalError,
                    isEqualToExpectedError: expectedError)
        
        networkClientMock.verifyOnce(
            .perform(
                endpoint: .value(endpoint),
                mapper: .any(LiveDataDTOToLiveDataMapper.Type.self),
                waitsUntilConnected: .value(false)
            )
        )
    }
}

private extension LiveDataRemoteDataSourceTests {
    func setupDependencies() {
        networkClientMock = .init()
        dataSource = .init(networkClient: networkClientMock)

        Matcher.default.register(EndpointProtocol.self) { lhs, rhs in
            guard let lhs = lhs as? Endpoint.LiveData,
                  let rhs = rhs as? Endpoint.LiveData else {
                      return false
                  }
            switch (lhs, rhs) {
            case (.getLiveData, .getLiveData):
                return lhs == rhs
            }
        }
    }
}
