//
//  SearchQuery.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

struct SearchQuery {
    
    let id: String?
    let input: String?
    let category: String?
    let location: Position
    let country: String?
    
    init(id: String? = nil, input: String? = nil, category: String? = nil, location: Position, country: String? = nil) {
        self.id = id
        self.input = input
        self.category = category
        self.location = location
        self.country = country
    }
}
