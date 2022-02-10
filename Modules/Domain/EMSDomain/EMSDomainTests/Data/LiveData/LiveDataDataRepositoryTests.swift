//
//  LiveDataDataRepositoryTests.swift
//  EMSDomain_Unit_EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SwiftyMocky
@testable import SharedTestingUtilities
@testable import EMSDomain

final class LiveDataDataRepositoryTests: XCTestCase {
    private var dataRepository: LiveDataDataRepository!
    private var remoteDataSourceMock: LiveDataRemoteDataSourceProtocolMock!

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()
        dataRepository = nil
        remoteDataSourceMock = nil
    }

    func testGetLiveDataSuccess() throws  {
        let expectedLiveData = LiveData.any
        remoteDataSourceMock.given(
            .getLiveData(willReturn: .just(expectedLiveData))
        )

        let publisher = dataRepository.getLiveData()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedLiveData)
        
        remoteDataSourceMock.verify(.getLiveData(), count: .once)
    }

    func testGetLiveDataFailure() throws  {
        let expectedError = TestError.error1
        remoteDataSourceMock.given(
            .getLiveData(willReturn: .failure(error: expectedError))
        )

        let publisher = dataRepository.getLiveData()
        let optionalError = try waitForPublisherError(publisher)
        assertError(optionalError,
                    isEqualToExpectedError: expectedError)
        
        remoteDataSourceMock.verify(.getLiveData(), count: .once)
    }
}

private extension LiveDataDataRepositoryTests {
    func setupDependencies() {
        remoteDataSourceMock = LiveDataRemoteDataSourceProtocolMock()
        dataRepository = LiveDataDataRepository(
            remoteDataSource: remoteDataSourceMock
        )
    }
}
