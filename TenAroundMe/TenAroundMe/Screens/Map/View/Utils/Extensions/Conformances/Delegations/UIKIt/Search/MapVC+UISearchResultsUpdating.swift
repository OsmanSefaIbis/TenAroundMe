//
//  MapVC+UISearchResultsUpdating.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

extension MapVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        let searchResultVC = searchController.searchResultsController as? SearchResultsVC
        searchResultVC?.view.backgroundColor = .lightGray.withAlphaComponent(0.4)
        
    }
    
    
}
