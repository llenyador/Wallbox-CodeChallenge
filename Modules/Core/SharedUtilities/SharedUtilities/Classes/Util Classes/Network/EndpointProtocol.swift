//
//  EndpointProtocol.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 16/3/21.
//

public protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var parameters: Encodable? { get }
    var method: HTTPMethod { get }
    var contentType: ContentType { get }
    #if DEBUG
    var mockedDataFilePath: String { get }
    #endif
}

public extension EndpointProtocol {
    var contentType: ContentType {
        .applicationJson
    }
}

/// Namespace to extend for endpoints.
public enum Endpoint {}
