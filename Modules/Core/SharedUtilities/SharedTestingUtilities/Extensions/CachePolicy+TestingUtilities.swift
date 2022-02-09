//
//  CachePolicy+TestingUtilities.swift
//  AppHost-BooksDomain-Unit-Tests
//
//  Created by Aitor Salvador on 2/1/22.
//

import SharedUtilities

extension CachePolicy: CaseIterable {
    public static var allCases: [CachePolicy] {
        [
            .fromCacheIfAvailable,
            .fromCacheThenUpdate,
            .ignoringCache,
            .cacheOnly
        ]
    }
}
