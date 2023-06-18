//
//  SearchDTO.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct SearchDTO: Decodable {
    let items: [Search_Item]?
}

struct Search_Item: Decodable {
    let title, id: String?
    @NilOnFail var language: Search_Language?
    @NilOnFail var resultType: Search_ResultType?
    let address: Search_Address?
    let position: Search_Position?
    let access: [Search_Position]?
    let distance: Int?
    let categories: [Search_Category]?
    let references: [Search_Reference]?
    let contacts: [Search_Contact]?
    let chains: [Search_Chain]?
    let openingHours: [Search_OpeningHour]?
    let foodTypes: [Search_Category]?
    let payment: Search_Payment?
}

struct Search_Position: Decodable {
    let lat, lng: Double?
}

struct Search_Address: Decodable {
    let label: String?
    @NilOnFail var countryCode: Search_CountryCode?
    @NilOnFail var countryName: Search_CountryName?
    @NilOnFail var county: Search_County?
    @NilOnFail var city: Search_City?
    @NilOnFail var district: Search_District?
    @NilOnFail var street: Search_Street?
    let postalCode, houseNumber: String?
}

struct Search_Category: Decodable {
    let id, name: String?
    let primary: Bool?
}

struct Search_Chain: Decodable {
    let id, name: String?
}

struct Search_Contact: Decodable {
    let phone: [Search_Fax]?
    let mobile: [Search_Mobile]?
    let www, fax: [Search_Fax]?
}

struct Search_Fax: Decodable {
    let value: String?
    let categories: [Search_Supplier]?
}

struct Search_Supplier: Decodable {
    let id: String?
}

struct Search_Mobile: Decodable {
    let value: String?
}

enum Search_Language: String, Decodable {
    case en = "en"
    case it = "it"
    case tr = "tr"
}

struct Search_OpeningHour: Decodable {
    let text: [String]?
    let isOpen: Bool?
    let structured: [Search_Structured]?
    let categories: [Search_Supplier]?
}

struct Search_Structured: Decodable {
    let start, duration, recurrence: String?
}

struct Search_Payment: Decodable {
    let methods: [Search_Method]?
}

struct Search_Method: Decodable {
    let id: String?
    let accepted: Bool?
}

struct Search_Reference: Decodable {
    let supplier: Search_Supplier?
    let id: String?
}

enum Search_ResultType: String, Decodable {
    case place = "place"
}

enum Search_City: String, Decodable {
    case çankaya = "Çankaya"
}

enum Search_CountryCode: String, Decodable {
    case tur = "TUR"
}

enum Search_CountryName: String, Decodable {
    case turkiye = "Turkiye"
}

enum Search_County: String, Decodable {
    case ankara = "Ankara"
}

enum Search_District: String, Decodable {
    case barbaros = "Barbaros"
    case kavaklıdere = "Kavaklıdere"
    case remziOğuzArık = "Remzi Oğuz Arık"
}

enum Search_Street: String, Decodable {
    case johnFKennedyCaddesi = "John F. Kennedy Caddesi"
    case tunalıHilmiCaddesi = "Tunalı Hilmi Caddesi"
}

@propertyWrapper public struct NilOnFail<T: Decodable>: Decodable {
    
    public let wrappedValue: T?
    public init(from decoder: Decoder) throws {
        wrappedValue = try? T(from: decoder)
    }
    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
