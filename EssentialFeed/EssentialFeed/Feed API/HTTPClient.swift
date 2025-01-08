//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Mariana Alvarez de Carvalho on 8/1/2025.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case error(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
