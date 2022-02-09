//
//  Publisher + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 19/06/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Combine
 
public extension Publisher {
    func sinkOnMain(
        onSuccess: ((Output) -> Void)?,
        onFailure: ((Failure) -> Void)?,
        onFinish: (() -> Void)?
    ) -> AnyCancellable {
        receiveOnMain()
            .sink(onSuccess: onSuccess,
                  onFailure: onFailure,
                  onFinish: onFinish)
    }

    func sinkOnMain(
        onSuccess: @escaping ((Output) -> Void),
        onFailure: @escaping ((Failure) -> Void)
    ) -> AnyCancellable {
        sinkOnMain(onSuccess: onSuccess, onFailure: onFailure, onFinish: nil)
    }

    func sinkOnMain(
        onSuccess: @escaping ((Output) -> Void)
    ) -> AnyCancellable {
        sinkOnMain(onSuccess: onSuccess, onFailure: nil, onFinish: nil)
    }

    func sink(onSuccess: ((Output) -> Void)? = nil,
              onFailure: ((Failure) -> Void)? = nil,
              onFinish: (() -> Void)? = nil) -> AnyCancellable {
        sink(receiveCompletion: { (completionResult) in
            switch completionResult {
            case .finished:
                onFinish?()
            case let .failure(error):
                onFailure?(error)
            }
        }) { (output) in
            onSuccess?(output)
        }
    }
    
    func receiveOnMain() -> Publishers.ReceiveOn<Self, DispatchQueue> {
        receive(on: DispatchQueue.main)
    }
    
    func subscribeOnBackground() -> Publishers.SubscribeOn<Self, DispatchQueue> {
        subscribe(on: DispatchQueue.global(qos: .background))
    }
}
