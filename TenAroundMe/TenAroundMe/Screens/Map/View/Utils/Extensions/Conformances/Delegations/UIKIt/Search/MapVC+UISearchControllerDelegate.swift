//
//  MapVC+UISearchControllerDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import UIKit

extension MapVC: UISearchControllerDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController) {
        viewModel.isSearchActive = true
        print("Search is activated")
        
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        viewModel.isSearchActive = false
        print("Search is de-activated")
    }
}
