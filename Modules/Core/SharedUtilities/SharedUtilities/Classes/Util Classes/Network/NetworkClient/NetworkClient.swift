//
//  NetworkClient.swift
//  Data
//
//  Created by Aitor Salvador García on 21/10/2020.
//

import Foundation
import Reachability
import Combine

struct VoidResponse: Decodable {}

final class NetworkClient {
    private let jsonDecoder = JSONDecoder()
    private let reachability = CombineReachability.shared
    
    init() {}
}

// MARK: - NetworkClientProtocol
extension NetworkClient: NetworkClientProtocol {
    public func perform<Output: Decodable>(
        endpoint: EndpointProtocol,
        waitsUntilConnected: Bool
    ) -> AnyPublisher<Output, Error> {
        convertToURLRequest(endpoint: endpoint)
            .flatMap { [weak self] (urlRequest: URLRequest) -> AnyPublisher<Output, Error> in
                guard let self = self else {
                    return .failure(error: CustomError.generic)
                }
                return self.perform(request: urlRequest,
                                    waitsUntilConnected: waitsUntilConnected)
            }.eraseToAnyPublisher()
    }

    public func perform<M: MapperProtocol>(endpoint: EndpointProtocol,
                                           mapper: M.Type,
                                           waitsUntilConnected: Bool)
    -> AnyPublisher<M.Output, Error> where M.Input: Decodable {
        convertToURLRequest(endpoint: endpoint)
            .flatMap { [weak self] (urlRequest: URLRequest) -> AnyPublisher<M.Input, Error> in
                guard let self = self else {
                    return .failure(error: CustomError.generic)
                }
                return self.perform(request: urlRequest,
                                    waitsUntilConnected: waitsUntilConnected)
            }
            .tryMap { result -> M.Output in
                try mapper.map(result)
            }
            .eraseToAnyPublisher()
    }

    public func perform<M: MapperProtocol>(endpoint: EndpointProtocol,
                                           arrayMapper: M.Type,
                                           waitsUntilConnected: Bool)
    -> AnyPublisher<[M.Output], Error> where M.Input: Decodable {
        convertToURLRequest(endpoint: endpoint)
            .flatMap { [weak self] (urlRequest: URLRequest) -> AnyPublisher<[M.Input], Error> in
                guard let self = self else {
                    return .failure(error: CustomError.generic)
                }
                return self.perform(request: urlRequest,
                                    waitsUntilConnected: waitsUntilConnected)
            }
            .tryMap { results -> [M.Output] in
                try arrayMapper.map(results)
            }
            .eraseToAnyPublisher()
    }
    
    public func perform(endpoint: EndpointProtocol,
                        waitsUntilConnected: Bool) -> AnyPublisher<Void, Error> {
        convertToURLRequest(endpoint: endpoint)
            .flatMap { urlRequest -> AnyPublisher<VoidResponse, Error> in
                self.doRequest(with: urlRequest)
            }.map { _ in
                ()
            }.eraseToAnyPublisher()
    }
}

// MARK: - Private
private extension NetworkClient {
    func perform<Output: Decodable>(
        request: URLRequest,
        waitsUntilConnected: Bool
    ) -> AnyPublisher<Output, Error> {
        onceReachabilityConditionsReached(waitsUntilConnected)
            .flatMap { _ -> AnyPublisher<Output, Error> in
                self.doRequest(with: request)
            }.eraseToAnyPublisher()
    }

    func doRequest<Output: Decodable>(
        with urlRequest: URLRequest
    ) -> AnyPublisher<Output, Error> {
        urlSessionPublisher(for: urlRequest)
            .tryMap { result -> Output in
                try self.jsonDecoder.decode(Output.self, from: result.data)
            }.eraseToAnyPublisher()
    }

    func urlSessionPublisher(
        for urlRequest: URLRequest
    ) -> AnyPublisher<URLSession.DataTaskPublisher.Output, Error> {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        return URLSession(configuration: config)
            .dataTaskPublisher(for: urlRequest)
            .eraseToAnyPublisher()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }

    func onceReachabilityConditionsReached(
        _ waitsUntilConnected: Bool
    ) -> AnyPublisher<Void, Error> {
        reachability
            .isReachable
            .filter {
                !waitsUntilConnected ||
                    ($0 && waitsUntilConnected)
            }
            .prefix(1)
            .setFailureType(to: Error.self)
            .flatMap { isConnected -> AnyPublisher<Void, Error> in
                if isConnected {
                    return .just( () )
                } else {
                    #if DEBUG
                    if waitsUntilConnected && !isConnected {
                        assertionFailure("""
                            it should not happen. waitsUntilConnected is
                            true but there is no connection available
                        """)
                    }
                    #endif
                    return .failure(error: CustomError.noInternetConnection)
                }
            }
            .eraseToAnyPublisher()
    }

    func convertToURLRequest(endpoint: EndpointProtocol) -> FutureResult<URLRequest> {
        FutureResult { fulfill in
            do {
                let request = try URLRequestConverter.convertToUrlRequest(endpoint: endpoint)
                fulfill(.success(request))
            } catch {
                fulfill(.failure(error))
            }
        }
    }
}
