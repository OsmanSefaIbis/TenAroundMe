//
//  DetailDTO.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct DetailDTO: Decodable {
    let title, id, language, resultType: String?
    let address: DetailAddress?
    let position: DetailPosition?
    let access: [DetailPosition]?
    let categories: [DetailCategory]?
    let chains: [DetailChain]?
    let references: [DetailReference]?
    let contacts: [DetailContact]?
}

struct DetailPosition: Decodable {
    let lat, lng: Double?
}

struct DetailAddress: Decodable {
    let label, countryCode, countryName, county: String?
    let city, district, street, postalCode: String?
}

struct DetailCategory: Decodable {
    let id, name: String?
    let primary: Bool?
}

struct DetailChain: Decodable {
    let id, name: String?
}

struct DetailContact: Decodable {
    let phone: [DetailPhone]?
}

struct DetailPhone: Decodable {
    let value: String?
}

struct DetailReference: Decodable {
    let supplier: DetailSupplier?
    let id: String?
}

struct DetailSupplier: Decodable {
    let id: String?
}
