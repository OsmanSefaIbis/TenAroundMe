//
//  SuggestDTO.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct SuggestDTO: Decodable {
    let items: [Suggest_Item]?
}

struct Suggest_Item: Decodable {
    let title, id, resultType: String?
    let href: String?
    let highlights: Suggest_Highlights?
    let address: Suggest_ItemAddress?
    let position: Suggest_Position?
    let access: [Suggest_Position]?
    let distance: Int?
    let categories: [Suggest_Category]?
    let references: [Suggest_Reference]?
    let chains: [Suggest_Chain]?
}

struct Suggest_Position: Decodable {
    let lat, lng: Double?
}

struct Suggest_ItemAddress: Decodable {
    let label: String?
}

struct Suggest_Category: Decodable {
    let id, name: String?
    let primary: Bool?
}

struct Suggest_Chain: Decodable {
    let id, name: String?
}

struct Suggest_Highlights: Decodable {
    let title: [Suggest_Title]?
    let address: Suggest_HighlightsAddress?
}

struct Suggest_HighlightsAddress: Decodable {
    let label: [Suggest_Title]?
}

struct Suggest_Title: Decodable {
    let start, end: Int?
}

struct Suggest_Reference: Decodable {
    let supplier: Suggest_Supplier?
    let id: String?
}

struct Suggest_Supplier: Decodable {
    let id: Suggest_ID?
}

enum Suggest_ID: String, Decodable {
    case core = "core"
    case tripadvisor = "tripadvisor"
    case yelp = "yelp"
}
