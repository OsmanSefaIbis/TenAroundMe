//
//  HERE_GeocodingSearchAPI_v7+Extension.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

extension GeocodingSearchAPI {
    
    /// Base URLs
    public var discoverBaseUrl: String {
        API.scheme.get()
            .appending(API.discoverPrefix.get())
            .appending(API.domain.get())
    }
    public var browseBaseUrl: String {
        API.scheme.get()
            .appending(API.browsePrefix.get())
            .appending(API.domain.get())
    }
    public var lookUpBaseUrl: String {
        API.scheme.get()
            .appending(API.lookupPrefix.get())
            .appending(API.domain.get())
    }
    public var autosuggestBaseUrl: String {
        API.scheme.get()
            .appending(API.autosuggestPrefix.get())
            .appending(API.domain.get())
    }
    public var autocompleteBaseUrl: String {
        API.scheme.get()
            .appending(API.autocompletePrefix.get())
            .appending(API.domain.get())
    }
    public var geocodeBaseUrl: String {
        API.scheme.get()
            .appending(API.geocodePrefix.get())
            .appending(API.domain.get())
    }
    public var revgeocodeBaseUrl: String {
        API.scheme.get()
            .appending(API.revgeocodePrefix.get())
            .appending(API.domain.get())
    }
    
    /// Resource Paths
    public var discoverPath: String { API.version.get().appending(API.discoverPath.get()) }
    public var browsePath: String { API.version.get().appending(API.browsePath.get()) }
    public var lookUpPath: String { API.version.get().appending(API.lookupPath.get()) }
    public var autosuggestPath: String { API.version.get().appending(API.autosuggestPath.get()) }
    public var autoCompletePath: String { API.version.get().appending(API.autocompletePath.get()) }
    public var geocodePath: String { API.version.get().appending(API.geocodePath.get()) }
    public var revgeocodePath: String { API.version.get().appending(API.revgeocodePath.get()) }
    
}

