//
//  SearchModel.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct PlacesDataModel{
    
    let id: String
    let title: String
    let position: Position
    let distance: Int
    let website: String
    let phone: String
    let openHour: String
    let categories: [PlacesCategory]
    let categoryLabel: String
    let openingHours: [PlacesOpeningHour]
    let address: PlacesAddress
    let addressLabel: String
}
