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
    let hrefCategory: String?
    let location: Position?
    let country: String?
    
    init(id: String? = nil, input: String? = nil, hrefCategory: String? = nil, location: Position? = nil, country: String? = nil) {
        self.id = id
        self.input = input
        self.hrefCategory = hrefCategory
        self.location = location
        self.country = country
    }
}
