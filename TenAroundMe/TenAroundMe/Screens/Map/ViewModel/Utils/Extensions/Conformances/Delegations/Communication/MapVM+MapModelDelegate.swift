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
                hrefCategory: $0.href ?? "",
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
        let searchData: [PlacesDataModel] = model.searchResults.map {
            
            let placeCategories = $0.categories?.map { category in
                return PlacesCategory(id: category.id ?? "",
                                      name: category.name ?? "",
                                      primary: category.primary ?? false)
            } ?? []
            let categoryNames = placeCategories.compactMap { $0.name }
            let categoriesString = categoryNames.joined(separator: " • ")
            
            let placeOpeningHours = $0.openingHours?.map { hours in
                return PlacesOpeningHour(text: hours.text ?? [],
                                         isOpen: hours.isOpen ?? false,
                                         structured: hours.structured ?? [])
            } ?? []
            
            let contacts = $0.contacts?.map { contact in
                return PlacesContact(phone: contact.phone,
                                     mobile: contact.mobile,
                                     www: contact.www)
            } ?? []
            
            
            let placeAddress: PlacesAddress =
                .init(label: $0.address?.label,
                      countryCode: nil,
                      countryName: nil,
                      county: nil,
                      city: nil,
                      district: $0.address?.district,
                      street: $0.address?.street,
                      postalCode: nil,
                      houseNumber: nil)
            
            return PlacesDataModel(
                id: $0.id ?? "",
                title: $0.title ?? "",
                position: .init(latitude: $0.position?.lat ?? 0,
                                longitude: $0.position?.lng ?? 0),
                distance: $0.distance ?? 0,
                website: contacts.first?.www?.first?.value ?? "",
                phone: contacts.first?.phone?.first?.value ?? "",
                openHour: placeOpeningHours.first?.text?.first ?? "",
                categories: placeCategories,
                categoryLabel: categoriesString,
                openingHours: placeOpeningHours,
                address: placeAddress,
                addressLabel: placeAddress.label ?? ""
            )
        }
        isNoPlaces = searchData.isEmpty
        self.delegate?.didRetrieveSearch(searchData)
    }
    
    func didFailFetch() {
        self.delegate?.didConnectionHalt(HardCoded.offlinePrompt.get())
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
