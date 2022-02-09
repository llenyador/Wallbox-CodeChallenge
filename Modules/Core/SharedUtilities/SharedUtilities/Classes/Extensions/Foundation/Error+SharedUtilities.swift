//
//  Error+SharedUtilities.swift
//  CourseDomain
//
//  Created by Aitor Salvador on 11/1/22.
//

public extension Error {
    func isEqual<E>(to error: E) -> Bool
    where E: Error, E: Equatable {
        guard let matchedError = self as? E else {
            return false
        }
        return matchedError == error
    }

    func isEqualTo(customError: CustomError) -> Bool {
        isEqual(to: customError)
    }

    var isItemNotFoundError: Bool {
        isEqualTo(customError: .itemNotFound)
    }
}
