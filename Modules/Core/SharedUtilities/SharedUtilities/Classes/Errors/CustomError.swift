//
//  CustomError.swift
//  Template
//
//  Created by Aitor Salvador on 04/10/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Foundation

public enum CustomError: LocalizedError, Equatable {
    case customMessage(String)
    case noInternetConnection
    case weakSelf
    case mapping
    case generic
    case unknownNetwork
    case parsingHttpBody
    case itemNotFound
    
    public var errorDescription: String? {
        switch self {
        case let .customMessage(message):
            return message
        case .noInternetConnection:
            return "error_custom_no_internet_connection".localized
        case .generic:
            return "error_custom_generic".localized
        case .parsingHttpBody:
            return "error_parsing_http_body".localized
        case .itemNotFound:
            return "error_item_not_found".localized
        case .mapping,
                .weakSelf,
                .unknownNetwork:
            return CustomError.generic.errorDescription
        }
    }
}
