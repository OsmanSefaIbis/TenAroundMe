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
    @IBOutlet weak var mapStyleSegment: UISegmentedControl!
    
    var locationManager: CLLocationManager? 
    
    
    lazy var viewModel = MapVM(mapView: self)
    lazy var searchResultsController: SearchResultsVC = {
        let resultsVC = SearchResultsVC(pass: self.viewModel)
        return resultsVC
    }()
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.delegate = self
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.mapView_viewDidLoad()
    }
    
    @IBAction func toggleMapStyle(_ sender: Any) { 
        if let segmentedControl = sender as? UISegmentedControl {
                switch segmentedControl.selectedSegmentIndex {
                    case 0:
                        map.mapType = .standard
                    case 1:
                        map.mapType = .satelliteFlyover
                    default:
                        break
                }
        }
    }
}

