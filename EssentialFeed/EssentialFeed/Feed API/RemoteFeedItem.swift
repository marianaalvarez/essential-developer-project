//
//  RemoteFeedItems.swift
//  EssentialFeed
//
//  Created by Mariana Alvarez de Carvalho on 19/2/2025.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
