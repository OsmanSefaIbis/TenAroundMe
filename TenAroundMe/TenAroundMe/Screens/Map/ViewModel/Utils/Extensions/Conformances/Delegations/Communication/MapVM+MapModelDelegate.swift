//
//  MapVM+MapModelDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

extension MapVM: MapModelDelegate {
    
    func didFetchSuggest() {
        let suggestData: [SuggestDataModel] = model.suggestionResults.map {
            .init(
                id: $0.id ?? "",
                title: $0.title ?? "",
                resutlType: $0.resultType ?? ""
            )
        }
        isNoSuggestion = suggestData.isEmpty
        self.delegate?.didRetrieveSuggest(suggestData)
    }
    
    func didFetchSearch() {
        let searchData: [SearchDataModel] = model.searchResults.map {
            .init(
                id: $0.id ?? "",
                title: $0.title ?? "",
                position: .init(latitude: $0.position?.lat ?? 0,
                                longitude: $0.position?.lng ?? 0),
                distance: $0.distance ?? 0
            )
        }
        isNoPlaces = searchData.isEmpty
        self.delegate?.didRetrieveSearch(searchData)
    }
    
    func didFetchLookUp() {
        print("Implement didFetchLookUp()")
    }
    
    func didFailFetch() {
        print("Implement didFailFetch()")
    }
    
    
}
