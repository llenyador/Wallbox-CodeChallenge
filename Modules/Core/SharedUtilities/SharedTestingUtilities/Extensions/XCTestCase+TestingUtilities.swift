//
//  XCTest+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 2/1/22.
//

import XCTest

public extension XCTestCase {
    func assertError<E>(
        _ obtainedError: Error?,
        isEqualToExpectedError expectedError: E,
        file: StaticString = #file,
        line: UInt = #line
    ) where E: Error, E: Equatable {
        XCTAssertEqual(obtainedError as? E,
                       expectedError,
                       file: file,
                       line: line)
    }

    func testMapper<M: MapperProtocol>(
        _ mapperType: M.Type,
        withInput input: M.Input,
        producesOutput expectedOutput: M.Output,
        file: StaticString = #file,
        line: UInt = #line
    ) throws
    where M.Output: Equatable {
        let output = try M.map(input)
        XCTAssertEqual(output,
                       expectedOutput,
                       file: file,
                       line: line)
    }
}
