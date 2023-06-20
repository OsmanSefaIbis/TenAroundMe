//
//  MapVC+UISearchControllerDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import UIKit

extension MapVC: UISearchControllerDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController) {
        /// update user location prior search
        guard let latitude = locationManager?.location?.coordinate.latitude,
              let longitude = locationManager?.location?.coordinate.longitude else { return }
        let location: Position = .init(latitude: latitude, longitude: longitude)
        viewModel.latestLocation = location
        
        viewModel.isSearchActive = true
        print("Search is activated")
        
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        viewModel.isSearchActive = false
        print("Search is de-activated")
    }
}
