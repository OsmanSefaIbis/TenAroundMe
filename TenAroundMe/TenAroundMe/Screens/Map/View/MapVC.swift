//
//  SearchVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 15.06.2023.
//

import UIKit
import MapKit

final class MapVC: UIViewController {
    
    @IBOutlet private weak var map: MKMapView!

    lazy var viewModel = MapVM(view: self)

    private lazy var searchResultsController: SearchResultsVC = {
        let resultsVC = SearchResultsVC(viewModel: self.viewModel)
        return resultsVC
    }()

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        configureSearchController()
        configureBottomSheet()
    }
    
    private func configureMap() {
        map.showsUserLocation = true
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    private func configureBottomSheet() {
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
    
}


