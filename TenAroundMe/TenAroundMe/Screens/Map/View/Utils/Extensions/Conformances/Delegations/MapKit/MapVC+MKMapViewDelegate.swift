//
//  MapVC+MKMapViewDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import MapKit

extension MapVC: MKMapViewDelegate {
    
    // TODO: Take advantage of this delegate !
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        
        resetFocuses()
        
        guard let placesAnnotation = annotation as? Places else { return }
        let selectedPlace = viewModel.latestPlaces.first { $0.id == placesAnnotation.id }
        selectedPlace?.isFocused = true
        
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
