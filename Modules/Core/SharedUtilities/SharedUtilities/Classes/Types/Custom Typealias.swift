//
//  Custom Typealias.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 08/06/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Combine

public typealias CompletionResult<T> = (Result<T, Error>) -> Void
public typealias CompletionResultWithError<T, E: Error> = (Result<T, E>) -> Void

public typealias PublisherResult<T> = AnyPublisher<T, Error>
public typealias FutureResult<T> = Future<T, Error>

public extension FutureResult {
    static func failure(_ error: Failure) -> Future<Output, Failure> {
        Future<Output, Failure>.init { handler in
            handler(.failure(error))
        }
    }
}

public extension Result {
    func toFuture(fromFutureCompletion future: CompletionResult<Success>) {
        switch self {
        case let .success(value):
            future(.success(value))
        case let .failure(error):
            future(.failure(error))
        }
    }
}
