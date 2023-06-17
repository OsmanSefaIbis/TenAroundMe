//
//  RequestQuery.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

struct RequestQuery{
    
    let search: SearchQuery?
    
    // TODO: add more
    init(search: SearchQuery? = nil) {
        self.search = search
    }

}
