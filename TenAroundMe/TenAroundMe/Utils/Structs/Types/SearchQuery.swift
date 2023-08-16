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
    let href: String?
    let location: Position?
    let country: String?
    
    init(id: String? = nil, input: String? = nil, href: String? = nil, location: Position? = nil, country: String? = nil) {
        self.id = id
        self.input = input
        self.href = href
        self.location = location
        self.country = country
    }
}
