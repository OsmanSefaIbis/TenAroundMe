//
//  MapVC+MapVCContract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import UIKit
import MapKit

extension MapVC: MapVCContract {
    
    func assignDelegates() {
        viewModel.delegate = self
        map.delegate = self
    }
    
    func configureMap() {
        map.showsUserLocation = true
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    func configureLocationManager(){
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestLocation()
    }
    
    func setSuggestion(with results: [SuggestDataModel]) {
        viewModel.setSuggestions(with: results)
    }
    
    func reloadSuggestions() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.searchResultsController.tableView.reloadData()
        }
    }
    
    func removeAnnotations() {
        map.removeAnnotations(map.annotations)
    }
    
    func setPlaces(with results: [SearchDataModel]) {
        viewModel.setPlaces(with: results)
    }
    
    func addAnnotations(with places: [Places]){
        places.forEach { place in
            map.addAnnotation(place)
        }
    }
    
    func presentPlaces(with places: [Places]) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let placesTableVC = PlacesResultsVC(with : places, pass: self.viewModel)
            placesTableVC.modalPresentationStyle = .pageSheet
            
            if let sheet = placesTableVC.sheetPresentationController {
                sheet.preferredCornerRadius = 20
                sheet.largestUndimmedDetentIdentifier = .large
                sheet.prefersGrabberVisible = true
                sheet.detents = [.custom(resolver: { context in
                    0.3 * context.maximumDetentValue}), .large()]
                self.present(placesTableVC, animated: true)
            }
        }
    }
}
