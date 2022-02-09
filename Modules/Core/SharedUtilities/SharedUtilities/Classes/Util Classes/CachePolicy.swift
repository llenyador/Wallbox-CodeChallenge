//
//  CachePolicy.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 13/10/21.
//

public enum CachePolicy {
    /// Does not get from remote if exists in cache.
    case fromCacheIfAvailable
    /// Returns from cache if available, then calls remote.
    case fromCacheThenUpdate
    /// Forces to use get remotelly ignoring if exists value in cache
    case ignoringCache
    /// Forces to use only cache
    case cacheOnly
}
