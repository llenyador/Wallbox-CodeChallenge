//
//  NetworkClientState.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 30/12/21.
//


#if DEBUG

import Combine

/// Changes between real/fake behaviour of NetworkClient at
/// runtime in function of the flag 'isFakeNetworkEnabled'
/// injected through SharedUtilitiesModule.
struct NetworkClientState {
    private let realNetworkClient: NetworkClientProtocol
    private let fakeNetworkClient: NetworkClientProtocol

    init(realNetworkClient: NetworkClientProtocol,
         fakeNetworkClient: NetworkClientProtocol) {
        self.realNetworkClient = realNetworkClient
        self.fakeNetworkClient = fakeNetworkClient
    }
}

// MARK: - NetworkClientProtocol
extension NetworkClientState: NetworkClientProtocol {
    func perform(endpoint: EndpointProtocol,
                 waitsUntilConnected: Bool) -> AnyPublisher<Void, Error> {
        if isFakeNetworkEnabled {
            return fakeNetworkClient.perform(endpoint: endpoint,
                                             waitsUntilConnected: waitsUntilConnected)
        } else {
            return realNetworkClient.perform(endpoint: endpoint,
                                             waitsUntilConnected: waitsUntilConnected)
        }
    }
    
    func perform<M>(
        endpoint: EndpointProtocol,
        mapper: M.Type,
        waitsUntilConnected: Bool
    ) -> AnyPublisher<M.Output, Error>
    where M : MapperProtocol, M.Input : Decodable {
        if isFakeNetworkEnabled {
            return fakeNetworkClient.perform(endpoint: endpoint,
                                             mapper: mapper,
                                             waitsUntilConnected: waitsUntilConnected)
        } else {
            return realNetworkClient.perform(endpoint: endpoint,
                                             mapper: mapper,
                                             waitsUntilConnected: waitsUntilConnected)
        }
    }

    func perform<M>(
        endpoint: EndpointProtocol,
        arrayMapper: M.Type,
        waitsUntilConnected: Bool
    ) -> AnyPublisher<[M.Output], Error>
    where M : MapperProtocol, M.Input : Decodable {
        if isFakeNetworkEnabled {
            return fakeNetworkClient.perform(endpoint: endpoint,
                                             arrayMapper: arrayMapper,
                                             waitsUntilConnected: waitsUntilConnected)
        } else {
            return realNetworkClient.perform(endpoint: endpoint,
                                             arrayMapper: arrayMapper,
                                             waitsUntilConnected: waitsUntilConnected)
        }
    }
}

private extension NetworkClientState {
    var isFakeNetworkEnabled: Bool {
        SharedUtilitiesModule.isFakeNetworkEnabled()
    }
}
#endif
