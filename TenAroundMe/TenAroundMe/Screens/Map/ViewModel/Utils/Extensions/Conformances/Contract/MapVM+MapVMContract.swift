//
//  MapVM+MapVMContract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

extension MapVM: MapVMContract {
    
    func mapView_viewDidLoad() {
        mapView?.assignDelegates()
        mapView?.configureMap()
        mapView?.configureSearchController()
        mapView?.configureBottomSheet()
    }
    
    func searchResultsView_viewDidLoad() {
        searchResultView?.configureTableView()
    }
    
    func searchIsActivated() {
        // TODO: think later
    }
    
    func searchIsDeactivated() {
        // TODO: think later
    }
    
    func textDidChange(with input: String) {
        
        let search = input.replacingOccurrences(of: "\\s+", with: "+", options: .regularExpression)
        isTypingActive = true
        
        timeControl?.invalidate()
        timeControl = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false, block: { [weak self] (timer) in
            guard let self else { return }
            switch search.count {
                case 0:
                    print("Implement Later")
            default:
                let query: SearchQuery = .init(input: search, location: .init(latitude: 39.9091, longitude: 32.8618))
                invokeAutoSuggest(with: query)
            }
        } )
        
    }
    
    func invokeAutoSuggest(with query: SearchQuery) {
        model.fetchAutoSuggest(with: query)
    }
    
    func setSuggestions(with results: [SuggestDataModel]) {
        suggestionResults = results
        mapView?.reloadTableView()
    }

}
