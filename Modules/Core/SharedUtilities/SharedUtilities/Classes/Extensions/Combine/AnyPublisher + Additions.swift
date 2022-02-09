//
//  AnyPublisher + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador on 21/03/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Combine

public extension AnyPublisher where Failure == Error  {
    static func futureError(_ error: Error) -> AnyPublisher<Output, Failure> {
        Future { (future) in
            future(.failure(CustomError.weakSelf))
        }.eraseToAnyPublisher()
    }

    static func failure(error: Failure) -> AnyPublisher<Output, Failure> {
        Fail(error: error)
            .eraseToAnyPublisher()
    }

    static func just<E: Error>(output: Output,
                               errorType: E.Type) -> AnyPublisher<Output, E> {
        Just(output)
            .setFailureType(to: errorType.self)
            .eraseToAnyPublisher()
    }

    static func just(_ output: Output) -> AnyPublisher<Output, Error> {
        Just(output)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func catchIfNotFound(
        _ returnCompletion: @autoclosure @escaping () -> PublisherResult<Output>
    ) -> PublisherResult<Output> {
        self.catch { error -> PublisherResult<Output> in
            if error.isItemNotFoundError {
                return returnCompletion()
            } else {
                return .failure(error: error)
            }
        }.eraseToAnyPublisher()
    }
}

public extension AnyPublisher where Failure == Error, Output == Void {
    static var void: AnyPublisher<Output, Error> {
        Just( () )
            .setFailureType(to: Failure.self)
            .eraseToAnyPublisher()
    }
}

public extension Future where Failure == Error  {
    static func just<E: Error>(output: Output) -> Future<Output, E> {
        .init { future in
            future(.success(output))
        }
    }
}
