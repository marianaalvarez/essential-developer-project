//
//  FeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Mariana Alvarez de Carvalho on 19/3/2025.
//

import Foundation

protocol FeedStoreTests {
    func test_retrieve_deliversEmptyOnEmptyCache()
    func test_retrieve_hasNoSideEffectOnEmptyCache()
    func test_retrieve_deliversFoundValuesOnNonEmptyCache()
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache()

    func test_insert_overridePreviouslyInsertedCacheValues()

    func test_delete_hasNoSideEffectsOnEmptyCache()
    func test_delete_emptiesPreviouslyInsertedCache()

    func test_storeSideEffects_runSerially()
}

protocol FailableRetrieveFeedStoreSpecs: FeedStoreTests {
    func test_retrieve_deliversFailureOnRetrievalError()
    func test_retrieve_hasNoSideEffetcsOnFailure()
}

protocol FailableInsertFeedStoreSpecs: FeedStoreTests {
    func test_insert_deliversErrorOnInsertionError()
    func test_insert_hasNoSideEffectsOnInsertionError()
}

protocol FailableDeleteFeedStoreSpecs: FeedStoreTests {
    func test_delete_deliversErrorOnDeletionError()
    func test_delete_hasNoSideEffectOnDeletionError()
}

typealias FailableFeedStoreSpecs = FailableRetrieveFeedStoreSpecs & FailableInsertFeedStoreSpecs & FailableDeleteFeedStoreSpecs
