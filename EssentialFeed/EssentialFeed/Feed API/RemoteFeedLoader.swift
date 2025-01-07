//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Mariana Alvarez de Carvalho on 20/12/2024.
//

import Foundation

public enum HTTPClientesult {
    case success(HTTPURLResponse)
    case error(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientesult) -> Void)
}

public final class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void = { _ in }) {
        client.get(from: url) { result in
            switch result {
            case .success:
                completion(.invalidData)
            case .error:
                completion(.connectivity)
            }
        }
    }
}
