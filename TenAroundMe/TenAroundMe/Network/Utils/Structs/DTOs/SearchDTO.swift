//
//  SearchDTO.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

// MARK: - Welcome
struct SearchDTO: Codable {
    let items: [SearchItem]?
}

// MARK: - Item
struct SearchItem: Codable {
    let title, id: String?
    let language: String?
    let resultType: String?
    let address: SearchAddress?
    let position: SearchPosition?
    let access: [SearchPosition]?
    let distance: Int?
    let categories: [SearchCategory]?
    let references: [SearchReference]?
    let contacts: [SearchContact]?
    let chains: [SearchChain]?
    let openingHours: [OpeningHour]?
}

// MARK: - Position
struct SearchPosition: Codable {
    let lat, lng: Double?
}

// MARK: - Address
struct SearchAddress: Codable {
    let label: String?
    let countryCode: String?
    let countryName: String?
    let county: String?
    let city: String?
    let district: String?
    let street: String?
    let postalCode, houseNumber: String?
}

// MARK: - Category
struct SearchCategory: Codable {
    let id, name: String?
    let primary: Bool?
}

// MARK: - Chain
struct SearchChain: Codable {
    let id, name: String?
}

// MARK: - Contact
struct SearchContact: Codable {
    let phone: [SearchPhone]?
    let mobile, www: [SearchMobile]?
}

// MARK: - Mobile
struct SearchMobile: Codable {
    let value: String?
}

// MARK: - Phone
struct SearchPhone: Codable {
    let value: String?
    let categories: [SearchSupplier]?
}

// MARK: - Supplier
struct SearchSupplier: Codable {
    let id: String?
}

// MARK: - OpeningHour
struct OpeningHour: Codable {
    let text: [String]?
    let isOpen: Bool?
    let structured: [Structured]?
}

// MARK: - Structured
struct Structured: Codable {
    let start, duration, recurrence: String?
}

// MARK: - Reference
struct SearchReference: Codable {
    let supplier: SearchSupplier?
    let id: String?
}
