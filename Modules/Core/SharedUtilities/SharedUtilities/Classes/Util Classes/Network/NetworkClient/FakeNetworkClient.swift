//
//  FakeNetworkClient.swift
//  BooksDomain
//
//  Created by Aitor Salvador on 30/12/21.
//


#if DEBUG
import Combine

struct FakeNetworkClient {
    private let bundle: Bundle
    private let queue = DispatchQueue(label: "com.SharedUtilities.FakeNetworkClient")

    init(bundle: Bundle) {
        self.bundle = bundle
    }
}

// MARK: - NetworkClientProtocol
extension FakeNetworkClient: NetworkClientProtocol {
    func perform<M>(
        endpoint: EndpointProtocol,
        mapper: M.Type,
        waitsUntilConnected: Bool
    )
    -> AnyPublisher<M.Output, Error>
    where M : MapperProtocol, M.Input : Decodable {
        FutureResult { future in
            delayResponse {
                do {
                    let networkResponse = try getDataFrom(endpoint: endpoint,
                                                          dataType: M.Input.self)
                    let output = try M.map(networkResponse)
                    return future(.success(output))
                } catch {
                    return future(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }

    func perform<M>(
        endpoint: EndpointProtocol,
        arrayMapper: M.Type,
        waitsUntilConnected: Bool
    )
    -> AnyPublisher<[M.Output], Error>
    where M : MapperProtocol, M.Input : Decodable {
        FutureResult { future in
            delayResponse {
                do {
                    let networkResponse = try getDataFrom(endpoint: endpoint,
                                                          dataType: [M.Input].self)
                    let output = try M.map(networkResponse)
                    return future(.success(output))
                } catch {
                    return future(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }

    func perform(
        endpoint: EndpointProtocol,
        waitsUntilConnected: Bool
    ) -> AnyPublisher<Void, Error> {
        FutureResult { future in
            delayResponse {
                do {
                    let _ = try getDataFrom(endpoint: endpoint,
                                            dataType: VoidResponse.self)
                    return future(.success( () ))
                } catch {
                    return future(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}

// MARK: - Private methods
private extension FakeNetworkClient {
    func getDataFrom<D: Decodable>(
        endpoint: EndpointProtocol,
        dataType: D.Type
    ) throws -> D {
        let jsonFilePath = endpoint.mockedDataFilePath
        return try JSONFileReader.object(
            ofType: D.self,
            fromFileName: jsonFilePath,
            bundle: bundle
        )
    }

    static let delayTimes = [0.1, 0.4, 0.25, 0.6]

    func delayResponse(closure: @escaping () -> Void) {
        let delayTime = Self.delayTimes.randomElement() ?? 0.3
        let when = DispatchTime.now() + delayTime
        queue.asyncAfter(deadline: when) {
            closure()
        }
    }
}
#endif
