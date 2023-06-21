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
            
            let categories = $0.categories?.map { category in
                return SuggestCategory(id: category.id ?? "", name: category.name ?? "", primary: category.primary ?? false)
            } ?? []
            
            let chains = $0.chains?.map { chain in
                return SuggestChain(id: chain.id ?? "", name: chain.name ?? "")
            } ?? []
            
            return SuggestDataModel(
                id: $0.id ?? "",
                title: $0.title ?? "",
                resutlType: $0.resultType ?? "",
                distance: $0.distance ?? 0,
                categories: categories,
                chains: chains
            )
        }
        isNoSuggestion = suggestData.isEmpty
        let sortedSuggestData = sortSuggestion(with: suggestData)
        self.delegate?.didRetrieveSuggest(sortedSuggestData)
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
    
    /// helper --> Sort the suggestData, order: category -> chain -> POI
    private func sortSuggestion(with data: [SuggestDataModel]) -> [SuggestDataModel] {
        var sortedData = data
        
        sortedData.sort { (item1, item2) -> Bool in
            let type1 = item1.resutlType
            let type2 = item2.resutlType
            
            if type1 == "categoryQuery" && type2 != "categoryQuery" {
                return true
            } else if type1 != "categoryQuery" && type2 == "categoryQuery" {
                return false
            } else if type1 == "chainQuery" && type2 != "chainQuery" {
                return true
            } else if type1 != "chainQuery" && type2 == "chainQuery" {
                return false
            } else if type1 != "categoryQuery" && type1 != "chainQuery" && type2 != "categoryQuery" && type2 != "chainQuery" {
                return item1.distance < item2.distance /// sort POI
            } else {
                return false
            }
        }
        
        return sortedData
    }

    
}
