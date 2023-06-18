//
//  MapVM+Contract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

protocol MapVMContract {
    
    func mapView_viewDidLoad()
    func searchResultsView_viewDidLoad()
    func searchIsActivated()
    func searchIsDeactivated()
    
    func textDidChange(with input: String)
    func invokeAutoSuggest(with query: SearchQuery)
    func setSuggestions(with results: [SuggestDataModel])
    
    func searchPerformed(with query: SearchQuery)
}
