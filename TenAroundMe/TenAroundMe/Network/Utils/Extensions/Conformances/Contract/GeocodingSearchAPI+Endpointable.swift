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
        .autoSuggest : autosuggestBaseUrl,
    ] }
    public var resourcePaths: Endpoints { [
        .browse : browsePath,
        .lookUpById : lookUpPath,
        .autoSuggest : autosuggestPath
    ] }
    public var queryParams: QueryParameters {
        
        switch self {
            case .browse(let searchInput, let location, let isoCountryCode):
                return ["name": searchInput, "at": location.get(),"lang": "en","in": isoCountryCode, "limit": 10, "apiKey": AppConstants.apiKey]
            case .lookUpById(let id, let isoCountryCode):
                return ["id": id, "lang": "en", "in": isoCountryCode, "apiKey": AppConstants.apiKey ]
            case .autoSuggest(let suggestInput, let location, let isoCountryCode):
                return ["q": suggestInput, "at": location.get(),"lang": "en", "in": isoCountryCode, "limit": 50, "apiKey": AppConstants.apiKey]
        }
    }
}
