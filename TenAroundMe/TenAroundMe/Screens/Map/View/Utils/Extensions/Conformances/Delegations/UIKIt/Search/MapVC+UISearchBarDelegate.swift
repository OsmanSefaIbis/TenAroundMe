//
//  MapVC+UISearchBarDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

extension MapVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let input = searchBar.text?.replacingOccurrences(of: "\\s+", with: "+", options: .regularExpression) else { return }
        guard let location = viewModel.latestLocation else { return }
        guard let country = viewModel.latestCountryCode else { return }
        let query: SearchQuery = .init(input: input, location: location, country: country)
        viewModel.performSearch(with: query)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        viewModel.searchIsDeactivated()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.textDidChange(with: searchText)
    }
}
