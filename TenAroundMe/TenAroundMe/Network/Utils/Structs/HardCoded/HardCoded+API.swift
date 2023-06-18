//
//  HardCoded+Api.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

enum API: String {
    
    case scheme, discoverPrefix, browsePrefix, lookupPrefix, autosuggestPrefix,
         autocompletePrefix, geocodePrefix, revgeocodePrefix, domain, version,
         limitParam, discoverPath, browsePath, lookupPath, autosuggestPath,
         autocompletePath, geocodePath, revgeocodePath
    
    func get() -> String {
        
        switch self {
            case .scheme: return "https://"
            case .discoverPrefix: return "discover."
            case .browsePrefix: return "browse."
            case .lookupPrefix: return "lookup."
            case .autosuggestPrefix: return "autosuggest."
            case .autocompletePrefix: return "autocomplete."
            case .geocodePrefix: return "geocode."
            case .revgeocodePrefix: return "revgeocode."
            case .domain: return "search.hereapi.com"
            case .version: return "/v1"
            case .discoverPath: return "/discover"
            case .browsePath: return "/browse"
            case .lookupPath: return "/lookup"
            case .autosuggestPath: return "/autosuggest"
            case .autocompletePath: return "/autocomplete"
            case .geocodePath: return "/geocode"
            case .revgeocodePath: return "/revgeocode"
            case .limitParam: return "/limit=10"
        }
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
