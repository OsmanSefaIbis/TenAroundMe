//
//  SearchDTO.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct PlacesDTO: Decodable {
    let items: [PlacesItem]?
}

struct PlacesItem: Decodable {
    let title, id: String?
    let language: String?
    let resultType: String?
    let address: PlacesAddress?
    let position: PlacesPosition?
    let access: [PlacesPosition]?
    let distance: Int?
    let categories: [PlacesCategory]?
    let references: [PlacesReference]?
    let contacts: [PlacesContact]?
    let chains: [PlacesChain]?
    let openingHours: [PlacesOpeningHour]?
}


struct PlacesPosition: Decodable {
    let lat, lng: Double?
}
struct PlacesAddress: Decodable {
    let label: String?
    let countryCode: String?
    let countryName: String?
    let county: String?
    let city: String?
    let district: String?
    let street: String?
    let postalCode, houseNumber: String?
}

struct PlacesCategory: Decodable {
    let id, name: String?
    let primary: Bool?
}

struct PlacesChain: Decodable {
    let id, name: String?
}

struct PlacesContact: Decodable {
    let phone: [PlacesPhone]?
    let mobile, www: [PlacesMobile]?
}

struct PlacesMobile: Decodable {
    let value: String?
}

struct PlacesPhone: Decodable {
    let value: String?
    let categories: [PlacesSupplier]?
}

struct PlacesSupplier: Decodable {
    let id: String?
}

struct PlacesOpeningHour: Decodable {
    let text: [String]?
    let isOpen: Bool?
    let structured: [PlacesStructured]?
}

struct PlacesStructured: Decodable {
    let start, duration, recurrence: String?
}

struct PlacesReference: Decodable {
    let supplier: PlacesSupplier?
    let id: String?
}
