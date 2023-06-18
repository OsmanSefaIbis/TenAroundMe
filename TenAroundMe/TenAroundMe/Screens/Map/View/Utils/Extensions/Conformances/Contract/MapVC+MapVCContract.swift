//
//  MapVC+MapVCContract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import UIKit

extension MapVC: MapVCContract {
    
    func assignDelegates() {
        viewModel.delegate = self
    }
    
    func configureMap() {
        map.showsUserLocation = true
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    func configureBottomSheet() {
        let detail = DetailVC()
        let navigateDetail = UINavigationController(rootViewController: detail)

        navigateDetail.isModalInPresentation = true
        if let sheet = navigateDetail.sheetPresentationController {
            sheet.preferredCornerRadius = 40
            sheet.detents = [.custom(resolver: { context in
                0.05 * context.maximumDetentValue
            }), .large() ]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
        }
        present(navigateDetail, animated: true)
    }
    
    func setSuggestion(_ results: [SuggestDataModel]) {
        viewModel.setSuggestions(with: results)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.searchResultsController.tableView.reloadData()
        }
    }
    
    
}
