//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Mariana Alvarez de Carvalho on 16/12/2024.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }
}
