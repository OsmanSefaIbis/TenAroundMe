//
//  MapVC+UISearchResultsUpdating.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

extension MapVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        // TODO: API has Auto complete or Auto suggest use it here to feed
        
        guard let text = searchController.searchBar.text else { return }
        let searchResultVC = searchController.searchResultsController as? SearchResultsVC
        searchResultVC?.view.backgroundColor = .lightGray.withAlphaComponent(0.4)
        
        print(text)
    }
    
    
}
