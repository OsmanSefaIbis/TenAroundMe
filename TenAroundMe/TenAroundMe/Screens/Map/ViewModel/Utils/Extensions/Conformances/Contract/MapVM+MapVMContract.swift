//
//  MapVM+MapVMContract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation
import CoreLocation
import MapKit

extension MapVM: MapVMContract {
    
    func mapView_viewDidLoad() {
        mapView?.assignDelegates()
        mapView?.configureLocationManager()
        mapView?.configureMap()
        mapView?.configureSearchController()
        mapView?.configureBottomSheet()
    }
    
    func searchResultsView_viewDidLoad() {
        searchResultView?.configureTableView()
    }
    
    func searchIsActivated() {
        // TODO: think later
    }
    
    func searchIsDeactivated() {
        // TODO: think later
    }
    
    func textDidChange(with input: String) {
        
        let search = input.replacingOccurrences(of: "\\s+", with: "+", options: .regularExpression)
        isTypingActive = true
        
        timeControl?.invalidate()
        timeControl = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false, block: { [weak self] (timer) in
            guard let self else { return }
            switch search.count {
                case 0:
                    print("Implement Later")
            default:
                guard let position = latestLocation else { return } //?
                let query: SearchQuery = .init(input: search, location: position)
                performAutoSuggest(with: query)
            }
        } )
        
    }
    
    func performAutoSuggest(with query: SearchQuery) {
        model.fetchAutoSuggest(with: query)
    }
    
    func setSuggestions(with results: [SuggestDataModel]) {
        suggestionResults = results
        mapView?.reloadTableView()
    }
    
    func performSearch(with query: SearchQuery) {
        mapView?.removeAnnotations()
        model.fetchSearch(with: query)
    }
    
    func setPlaces(with results: [SearchDataModel]) {
        
        let places = results.map { searchDataModel -> Places in
            let coordinates = CLLocationCoordinate2D(latitude: searchDataModel.position.latitude,
                                                     longitude: searchDataModel.position.longitude)
            let placemark = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark)
            
            return Places(mapItem: mapItem)
        }
        
        mapView?.addAnnotations(with: places)
    }

}
