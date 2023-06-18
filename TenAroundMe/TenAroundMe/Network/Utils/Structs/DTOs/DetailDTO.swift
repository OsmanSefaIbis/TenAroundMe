//
//  DetailDTO.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct DetailDTO: Decodable {
    let title, id, language, resultType: String?
    let address: Detail_Address?
    let position: Detail_Position?
    let access: [Detail_Position]?
    let categories: [Detail_Category]?
    let chains: [Detail_Chain]?
    let references: [Detail_Reference]?
    let contacts: [Detail_Contact]?
}

struct Detail_Position: Decodable {
    let lat, lng: Double?
}

struct Detail_Address: Decodable {
    let label, countryCode, countryName, county: String?
    let city, district, street, postalCode: String?
}

struct Detail_Category: Decodable {
    let id, name: String?
    let primary: Bool?
}

struct Detail_Chain: Decodable {
    let id, name: String?
}

struct Detail_Contact: Decodable {
    let phone: [Detail_Phone]?
}

struct Detail_Phone: Decodable {
    let value: String?
}

struct Detail_Reference: Decodable {
    let supplier: Detail_Supplier?
    let id: String?
}

struct Detail_Supplier: Decodable {
    let id: String?
}
