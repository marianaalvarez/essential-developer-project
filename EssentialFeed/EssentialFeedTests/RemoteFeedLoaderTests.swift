//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Mariana Alvarez de Carvalho on 16/12/2024.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        self.requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        let url = URL(string: "https://a-url.com")!
        _ = RemoteFeedLoader(client: client, url: url)

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_RequestDataFromURL() {
        let client = HTTPClientSpy()
        let url = URL(string: "https://a-url.com")!
        let sut = RemoteFeedLoader(client: client, url: url)
        
        sut.load()

        XCTAssertEqual(client.requestedURL, url)
    }
}
