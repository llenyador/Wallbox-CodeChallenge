//
//  NetworkClientProtocol.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 16/3/21.
//

import Combine

// sourcery: AutoMockable
public protocol NetworkClientProtocol {
    func perform(endpoint: EndpointProtocol,
                 waitsUntilConnected: Bool) -> AnyPublisher<Void, Error>
    func perform<M: MapperProtocol>(endpoint: EndpointProtocol,
                                    mapper: M.Type,
                                    waitsUntilConnected: Bool)
    -> AnyPublisher<M.Output, Error> where M.Input: Decodable
    func perform<M: MapperProtocol>(endpoint: EndpointProtocol,
                                    arrayMapper: M.Type,
                                    waitsUntilConnected: Bool)
    -> AnyPublisher<[M.Output], Error> where M.Input: Decodable
}

public extension NetworkClientProtocol {
    func perform<M: MapperProtocol>(endpoint: EndpointProtocol,
                                    mapper: M.Type)
    -> AnyPublisher<M.Output, Error> where M.Input: Decodable {
        perform(endpoint: endpoint,
                mapper: mapper,
                waitsUntilConnected: false)
    }

    func perform<M: MapperProtocol>(endpoint: EndpointProtocol,
                                    arrayMapper: M.Type)
    -> AnyPublisher<[M.Output], Error> where M.Input: Decodable {
        perform(endpoint: endpoint,
                arrayMapper: arrayMapper,
                waitsUntilConnected: false)
    }
}
