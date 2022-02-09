//
//  CombineReachability.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 03/11/2020.
//

import Combine
import Reachability

class CombineReachability {
    static let shared = CombineReachability()
    
    private let reachability = try? Reachability()
    
    private var subject: CurrentValueSubject<Bool, Never>
    private var cancellables: Set<AnyCancellable> = .init()
    
    init() {
        if let connection = reachability?.connection {
            subject = .init(connection != .unavailable)
        } else {
            subject = .init(false)
        }
        
        try? reachability?.startNotifier()
        
        Reachability.reachabilityChanged
            .sink(receiveValue: { [weak self] in
                let isConnected = $0.connection != .unavailable
                self?.subject.send(isConnected)
            })
            .store(in: &cancellables)
    }
    
    var isReachable: AnyPublisher<Bool, Never> {
        subject.eraseToAnyPublisher()
    }
}
