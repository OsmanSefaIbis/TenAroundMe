//
//  SuggestDTO.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct SuggestDTO: Decodable {
    let items: [SuggestItem]?
}

struct SuggestItem: Decodable {
    let title, id, resultType: String?
    let href: String?
    let highlights: SuggestHighlights?
    let address: SuggestItemAddress?
    let position: SuggestPosition?
    let access: [SuggestPosition]?
    let distance: Int?
    let categories: [SuggestCategory]?
    let references: [SuggestReference]?
    let chains: [SuggestChain]?
}

struct SuggestPosition: Decodable {
    let lat, lng: Double?
}

struct SuggestItemAddress: Decodable {
    let label: String?
}

struct SuggestCategory: Decodable {
    let id, name: String?
    let primary: Bool?
}

struct SuggestChain: Decodable {
    let id, name: String?
}

struct SuggestHighlights: Decodable {
    let title: [SuggestTitle]?
    let address: SuggestHighlightsAddress?
}

struct SuggestHighlightsAddress: Decodable {
    let label: [SuggestTitle]?
}

struct SuggestTitle: Decodable {
    let start, end: Int?
}

struct SuggestReference: Decodable {
    let supplier: SuggestSupplier?
    let id: String?
}

struct SuggestSupplier: Decodable {
    let id: String?
}
