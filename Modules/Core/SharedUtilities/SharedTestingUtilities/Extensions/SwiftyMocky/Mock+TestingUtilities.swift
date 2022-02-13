//
//  Mock+TestingUtilities.swift
//  AppHost-EMSDisplay-Unit-Tests
//
//  Created by Aitor Salvador on 13/2/22.
//

import SwiftyMocky

public extension Mock {
    func verifyOnce(
        _ method: Verify,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        verify(method, count: .once, file: file, line: line)
    }
}
