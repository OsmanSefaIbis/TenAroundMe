//
//  SearchVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 15.06.2023.
//

import UIKit
import MapKit

final class MapVC: UIViewController {
    
    @IBOutlet weak var map: MKMapView!

    lazy var viewModel = MapVM(mapView: self)
    lazy var searchResultsController: SearchResultsVC = {
        let resultsVC = SearchResultsVC(viewModel: self.viewModel)
        return resultsVC
    }()
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.mapView_viewDidLoad()
    }
    
}


