//
//  URLRequestHeadersProviderProtocol.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 16/3/21.
//

import Combine

public protocol URLRequestHeadersProviderProtocol {
    func provideHeadersTo(
        urlRequest: URLRequest
    ) -> AnyPublisher<URLRequest, Never>
}

public protocol URLRequestErrorHandlerProtocol {
    func tryRecoverFailedRequest(
        for urlRequest: URLRequest,
        withError error: Error
    ) throws -> AnyPublisher<Void, Error>
}
