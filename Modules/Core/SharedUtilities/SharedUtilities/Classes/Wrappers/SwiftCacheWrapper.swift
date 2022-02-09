//
//  SwiftCacheWrapper.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 09/07/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

/**
 - Usage:
 
        protocol SomeCacheWrapper: SwiftCacheWrapperProtocol where Key == SomeCacheKey, Value == SomeObject {}

        struct SomeCache {
            /**
            Singleton of cache in order to interact always with the same data   in memory.
            */
            private static let sharedCache: [Key: Value] = SwiftCache()
        }

        extension SomeCache: SomeCacheWrapper {
            func insert(_ value: SomeObject, forKey key: SomeCacheKey) {
                SomeCache.sharedCache.insert(value, forKey: key)
            }
            
            func value(forKey key: SomeCacheKey) -> SomeObject? {
                SomeCache.sharedCache.value(forKey: key)
            }
            
            func removeValue(forKey key: SomeCacheKey) {
                SomeCache.sharedCache.removeValue(forKey: key)
            }
            
            func removeAll() {
                SomeCache.sharedCache.removeAll()
            }
        }

        struct SomeCacheKey: Hashable {
            let id: String
        }
 */

public protocol SwiftCacheWrapperProtocol {
    associatedtype Key: Hashable
    associatedtype Value
    
    func insert(_ value: Value, forKey key: Key)
    func value(forKey key: Key) -> Value?
    func removeValue(forKey key: Key)
    func removeAll()
}
