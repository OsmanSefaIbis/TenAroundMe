//
//  HERE_GeocodingSearchAPI_v7+Endpointable.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

extension HERE_GeocodingSearchAPI_v7: Endpointable {
    
    /// GET Request
    public var request: RequestType { .get }
    
    /// All Base Urls
    public var baseUrls: [String] {
        [ discoverBaseUrl, browseBaseUrl, lookUpBaseUrl,
          autosuggestBaseUrl, autocompleteBaseUrl,
          geocodeBaseUrl, revgeocodeBaseUrl ]
    }
    /// All Resource Paths
    public var resourcePaths: [String] {
        [ discoverPath, browsePath, lookUpPath,
          autosuggestPath, autoCompletePath,
          geocodePath, revgeocodePath ]
    }
    
    /// Query Params for each endpoint
    public var params: Parameters {
        var params = Parameters()
        return params
    }
}

/*
 * Discover
https://discover.search.hereapi.com/v1/discover?q=hotels&in=circle:39.9091,32.8618;r=1000&limit=10
 * Browse
https://browse.search.hereapi.com/v1/browse?at=39.9091,32.8618&in=circle:39.9091,32.8618;r=1000&chain=2826&limit=10
 * LookUp
https://lookup.search.hereapi.com/v1/lookup?id=here:pds:place:792sxp6g-9901c22aaf16613af56bc7f348d70fbb&show=countryInfo
 * AutoSuggest
https://autosuggest.search.hereapi.com/v1/autosuggest?q=hotels&at=39.9091,32.8618&termLimit=5
 * AutoComplete
https://autocomplete.search.hereapi.com/v1/autocomplete?q=Berli&in=circle:10.00,10.00
 * Geocode
https://geocode.search.hereapi.com/v1/geocode?q=berlin&in=countryCode:TUR&limit=10
 * ReverseGeocode
https://revgeocode.search.hereapi.com/v1/revgeocode?in=circle:39.9091,32.8618;r=1
 */
