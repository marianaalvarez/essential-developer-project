//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Mariana Alvarez de Carvalho on 21/2/2025.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}
