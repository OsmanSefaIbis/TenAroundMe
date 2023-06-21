//
//  MapVC+MKMapViewDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import MapKit

extension MapVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        self.dismissPresentingPlacesList()
        resetFocuses()
        
        guard let placesAnnotation = annotation as? Places else { return }
        let selectedPlace = viewModel.latestPlaces.first { $0.id == placesAnnotation.id }
        selectedPlace?.isFocused = true
        viewModel.latestSelectedPlace = selectedPlace
        presentPlaces(with: viewModel.latestPlaces)
    }
    
    // helper
    private func resetFocuses() {
        viewModel.latestPlaces = viewModel.latestPlaces.map({ place in
            place.isFocused = false
            return place
        })
    }
    
}
