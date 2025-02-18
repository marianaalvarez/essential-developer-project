//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Mariana Alvarez de Carvalho on 18/2/2025.
//

import Foundation

public final class LocalFeedLoader {
    private let store: FeedStore
    private let currentDate: () -> Date
    
    public typealias SaveResult = Error?
    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(_ items: [FeedItem], completion: @escaping (SaveResult) -> Void) {
        store.deleteCachedFeed { [weak self] error in
            guard let self = self else { return }
            
            if let cachedDeletionError = error {
                completion(cachedDeletionError)
            } else {
                self.cache(items: items, with: completion)
            }
        }
    }
    
    private func cache(items: [FeedItem], with completion: @escaping (SaveResult) -> Void) {
        store.insert(items: items, timestamp: self.currentDate()) { [weak self] error in
            guard self != nil else { return }
            
            completion(error)
        }
    }
}
