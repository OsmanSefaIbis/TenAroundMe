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
        guard let latitude = locationManager?.location?.coordinate.latitude,
              let longitude = locationManager?.location?.coordinate.longitude else { return }
        guard let input = searchBar.text?.replacingOccurrences(of: "\\s+", with: "+", options: .regularExpression) else { return }
        let location: Position = .init(latitude: latitude, longitude: longitude)
        let query: SearchQuery = .init(input: input, location: location)
        viewModel.latestLocation = location //?
        viewModel.performSearch(with: query)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.textDidChange(with: searchText)
    }
}
