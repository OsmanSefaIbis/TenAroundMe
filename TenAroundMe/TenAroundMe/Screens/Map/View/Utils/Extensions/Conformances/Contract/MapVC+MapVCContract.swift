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
        map.showsCompass = true
        map.showsScale = true
        
        
        let locateUserButton = MKUserTrackingButton(mapView: map)
        locateUserButton.translatesAutoresizingMaskIntoConstraints = false
        locateUserButton.tintColor = .lightGray.withAlphaComponent(0.55)
        map.addSubview(locateUserButton)
        
        mapStyleSegment.selectedSegmentTintColor = .lightGray.withAlphaComponent(0.55)
        
        NSLayoutConstraint.activate([
            locateUserButton.trailingAnchor.constraint(equalTo: map.trailingAnchor, constant: -6),
            locateUserButton.bottomAnchor.constraint(equalTo: map.topAnchor, constant: 270)
        ])
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
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.map.removeAnnotations(map.annotations)
        }
    }
    
    func setPlaces(with results: [PlacesDataModel]) {
        viewModel.setPlaces(with: results)
    }
    
    func addAnnotations(with places: [Places]){
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            places.forEach { place in
                self.map.addAnnotation(place)
            }
        }
    }
    
    func presentPlaces(with places: [Places]) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let placesTableVC = PlacesResultsVC(pass: self.viewModel)
            placesTableVC.modalPresentationStyle = .pageSheet
            
            let cornerRadius: CGFloat = 40
            let contentInsets = UIEdgeInsets(top: cornerRadius+5, left: 0, bottom: 0, right: 0)
            placesTableVC.loadViewIfNeeded()
            placesTableVC.tableView.contentInset = contentInsets
            placesTableVC.tableView.scrollIndicatorInsets = contentInsets
            
            if let sheet = placesTableVC.sheetPresentationController {
                
                sheet.preferredCornerRadius = cornerRadius
                sheet.largestUndimmedDetentIdentifier = .large
                sheet.prefersGrabberVisible = true
                sheet.detents = [
                    .custom(resolver: { context in
                        0.2 * context.maximumDetentValue}),
                    .medium(), .large()]
                self.modalTransitionStyle = .crossDissolve
                self.present(placesTableVC, animated: true)
            }
        }
    }
    
    func dismissPresentingSuggestionsList() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if let presentingVC = self.presentedViewController {
                self.modalTransitionStyle = .crossDissolve
                presentingVC.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func dismissPresentingPlacesList() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if let presentingVC = self.sheetPresentationController?.presentedViewController {
                self.modalTransitionStyle = .crossDissolve
                presentingVC.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
