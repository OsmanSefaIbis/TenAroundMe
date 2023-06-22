//
//  MapModel.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

final class MapModel {
    
    weak var delegate: MapModelDelegate?
    
    private(set) var suggestionResults: [SuggestItem] = []
    private(set) var searchResults: [PlacesItem] = []
 
    private var network: NetworkAdapter { NetworkAdapter.shared }
    private var internet: InternetManager { InternetManager.shared }
    
    func fetchAutoSuggest(with query: SearchQuery){
        if internet.isOnline() {
            network.fetchSuggestion(by: query) { [weak self] response in
                guard let self else { return }
                switch response {
                    case .success(let data):
                    guard let results = data.items else { return }
                        self.suggestionResults = results
                        self.delegate?.didFetchSuggest()
                    case .failure(_):
                        self.delegate?.didFailFetch()
                }
            }
        } else {
            delegate?.didFailFetch()
        }
    }
    
    func fetchSearch(with query: SearchQuery){
        if internet.isOnline() {
            network.fetchSearch(by: query) { [weak self] response in
                guard let self else { return }
                switch response {
                    case .success(let data):
                    guard let results = data.items else { return }
                        self.searchResults = results
                        self.delegate?.didFetchSearch()
                    case .failure(_):
                        self.delegate?.didFailFetch()
                }
            }
        } else {
            delegate?.didFailFetch()
        }
    }
    
    func fetchSuggestSearch(with query: SearchQuery){
        if internet.isOnline() {
            network.fetchSuggestionSearch(by: query) { [weak self] response in
                guard let self else { return }
                switch response {
                    case .success(let data):
                    guard let results = data.items else { return }
                        self.searchResults = results
                        self.delegate?.didFetchSearch()
                    case .failure(_):
                        self.delegate?.didFailFetch()
                }
            }
        } else {
            delegate?.didFailFetch()
        }
    }
    
}
