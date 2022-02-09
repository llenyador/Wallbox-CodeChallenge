//
//  UserDefaultsWrapper.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 29/06/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public struct UserDefaultsKey {
    public let name: String
    
    public init(_ key: String) {
        guard !key.isEmpty else {
            fatalError("key cannot be empty")
        }
        
        if let bundleId = Bundle.main.bundleIdentifier {
            self.name = bundleId + "." + key
        } else {
             self.name = key
        }
    }
}

// sourcery: AutoMockable
public protocol UserDefaultsWrapperProtocol {
    func getValue<T>(forKey key: UserDefaultsKey) -> T?
    func getValue<T>(forKey key: UserDefaultsKey, defaultValue: T) -> T
    func setValue<T>(_ newValue: T, forKey key: UserDefaultsKey)
    func setData<T: Encodable>(_ newValue: T, forKey key: UserDefaultsKey)
    func getData<T: Decodable>(forKey key: UserDefaultsKey, defaultValue: T) -> T
    func removeObject(forKey key: UserDefaultsKey)
}

struct UserDefaultsWrapper {
    private let userDefaults: UserDefaults

    public init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
}

extension UserDefaultsWrapper: UserDefaultsWrapperProtocol {
    public func getValue<T>(forKey key: UserDefaultsKey) -> T? {
        return userDefaults.object(forKey: key.name) as? T
    }

    public func getValue<T>(forKey key: UserDefaultsKey, defaultValue: T) -> T {
        if let value = userDefaults.object(forKey: key.name) as? T {
            return value
        } else {
            return defaultValue
        }
    }
    
    public func setData<E: Encodable>(
        _ newValue: E,
        forKey key: UserDefaultsKey
    ) {
        do {
            let encodedObject = try JSONEncoder().encode(newValue)
            userDefaults.set(encodedObject, forKey: key.name)
        } catch {
            safeFatalError("Could not decode object of type \(E.self)")
        }
    }
    
    public func getData<D: Decodable>(
        forKey key: UserDefaultsKey, defaultValue: D
    ) -> D {
        if let data = userDefaults.data(forKey: key.name) {
            do {
                let decoder = JSONDecoder()
                let decodedObject = try decoder.decode(D.self, from: data)
                return decodedObject
            } catch {
                safeFatalError("Could not decode object of type \(D.self)")
                return defaultValue
            }
            
        } else {
            return defaultValue
        }
    }

    public func setValue<T>(_ newValue: T, forKey key: UserDefaultsKey) {
        userDefaults.set(newValue, forKey: key.name)
    }

    public func removeObject(forKey key: UserDefaultsKey) {
        userDefaults.removeObject(forKey: key.name)
    }
}
