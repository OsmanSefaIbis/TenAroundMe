//
//  SearchQuery.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

struct SearchQuery {
    
    let input: String?
    let category: String?
    let location: Position
    
    init(input: String? = nil, category: String? = nil, location: Position) {
        self.input = input
        self.category = category
        self.location = location
    }
}
