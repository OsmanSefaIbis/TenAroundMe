//
//  HERE_GeocodingSearchAPI_v7+Endpointable.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

extension GeocodingSearchAPI: Endpointable {
    
    public var request: RequestType { .get }
    public var baseUrls: Endpoints { [
        .browse : browseBaseUrl,
        .lookUpById : lookUpBaseUrl,
        .autoSuggest : autosuggestBaseUrl
    ] }
    public var resourcePaths: Endpoints { [
        .browse : browsePath,
        .lookUpById : lookUpPath,
        .autoSuggest : autosuggestPath
    ] }
    public var queryParams: QueryParameters {
        
        switch self {
            case .browse(let searchInput, let location):
                return ["name": searchInput, "at": location.get(),"lang": "en" , "limit": 10, "apiKey": AppConstants.apiKey]
            case .lookUpById(let id):
                return ["id": id, "lang": "en", "apiKey": AppConstants.apiKey ]
            case .autoSuggest(let suggestInput, let location):
                return ["q": suggestInput, "at": location.get(),"lang": "en", "limit": 50, "apiKey": AppConstants.apiKey]
        }
    }
}
