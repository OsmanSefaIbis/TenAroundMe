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
        print("Implement didFetchSearch()")
    }
    
    func didFetchLookUp() {
        print("Implement didFetchLookUp()")
    }
    
    func didFailFetch() {
        print("Implement didFailFetch()")
    }
    
    
}
