//
//  RequestQuery.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

struct RequestQuery{
    
    let search: SearchQuery?
    let id: String?
    let endpoint: EndpointTypes?
    
    init(search: SearchQuery? = nil, id: String? = nil, endpoint: EndpointTypes? = nil) {
        
        self.search = search
        self.id = id
        self.endpoint = endpoint
        
    }

}
