//
//  Reachability + Combine.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 20/10/2020.
//

import Combine
import Reachability

public extension Reachability {
    static var reachabilityChanged: AnyPublisher<Reachability, Never> {
        NotificationCenter.default.publisher(for: Notification.Name.reachabilityChanged)
            .compactMap { $0.object as? Reachability }
            .eraseToAnyPublisher()
    }
}
