//
//  String+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 2/1/22.
//

import Foundation

public extension StringProtocol {
    static var any: String {
        random()
    }
}

extension String: AnyCreatable {
}

public extension StringProtocol {
    static func random(length: Int? = nil) -> String {
        let length = length ?? Constants.defaultRandomStringLength
        let range = (0..<length)
        let setOfCharacters = Constants.alphanumericCharacters
        let generatedRandomString = range.reduce(into: "") { accumulatedString, _ in
            if let character = setOfCharacters.randomElement() {
                accumulatedString.append(String(character))
            } else {
                accumulatedString.append("0")
            }
        }
        return generatedRandomString
    }
}

private enum Constants {
    static let alphanumericCharacters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    static let defaultRandomStringLength = 5
}
