//
//  GetLiveDataUseCaseTests.swift
//  EMSDomain_Unit_EMSDomainTests
//
//  Created by Aitor Salvador on 10/2/22.
//

import XCTest
import SwiftyMocky
@testable import SharedTestingUtilities
@testable import EMSDomain

final class GetLiveDataUseCaseTests: XCTestCase {
    private var useCase: GetLiveDataUseCase!
    private var repositoryMock: LiveDataDataRepositoryProtocolMock!

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
        let expectedLiveData = LiveData.any
        repositoryMock.given(
            .getLiveData(willReturn: .just(expectedLiveData))
        )

        let publisher = useCase.execute()
        let output = try awaitPublisher(publisher)
        XCTAssertEqual(output, expectedLiveData)
        
        repositoryMock.verify(.getLiveData(), count: .once)
    }

    func testViewDidLoadFailure() throws {
        let expectedError = TestError.error1
        repositoryMock.given(
            .getLiveData(willReturn: .failure(error: expectedError))
        )

        let publisher = useCase.execute()
        let optionalError = try waitForPublisherError(publisher)
        assertError(optionalError,
                    isEqualToExpectedError: expectedError)

        repositoryMock.verify(.getLiveData(), count: .once)
    }
}

// MARK: Private methods
private extension GetLiveDataUseCaseTests {
    func setupDependencies() {
        repositoryMock = .init()
        useCase = .init(dataRepository: repositoryMock)
    }
}
