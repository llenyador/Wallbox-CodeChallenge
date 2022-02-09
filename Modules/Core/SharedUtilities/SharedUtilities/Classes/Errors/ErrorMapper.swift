//
//  ErrorMapper.swift
//  Landing
//
//  Created by Aitor Salvador García on 24/01/2021.
//

public enum ErrorMapper {
    public static func map(error: Error) -> String {
        var message: String = ""
        if let localizedError = error as? LocalizedError {
            message = localizedError.errorDescription.orEmpty
        } else {
            message = CustomError.generic.localizedDescription
        }
        return message
    }
}
