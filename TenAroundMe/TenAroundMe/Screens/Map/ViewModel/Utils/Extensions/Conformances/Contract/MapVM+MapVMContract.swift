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
    }
    
    func searchResultsView_viewDidLoad() {
        searchResultView?.configureTableView()
    }
    
    func placesResultsView_viewDidLoad() {
        placesResultView?.configureTableView()
    }
    
    func searchIsDeactivated() {
        self.mapView?.dismissPresentingPlacesList()
    }
    
    func textDidChange(with input: String) {
        
        if input.count == 0 { /// minor case
            self.searchResultView?.dumpData()
        }
        
        let search = input.replacingOccurrences(of: "\\s+", with: "+", options: .regularExpression)
        isTypingActive = true
        
        timeControl?.invalidate()
        timeControl = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false, block: { [weak self] (timer) in
            guard let self = self else { return }
            switch search.count {
                case 0:
                searchIsDeactivated() ; searchIsDeactivated()
            default:
                guard let position = self.latestLocation else { return }
                guard let country = self.latestCountryCode else { return }
                let query: SearchQuery = .init(input: search, location: position, country: country)
                performAutoSuggest(with: query)
                self.mapView?.dismissKeyboard()
            }
        } )
        
    }
    
    func performAutoSuggest(with query: SearchQuery) {
        model.fetchAutoSuggest(with: query)
        self.searchResultView?.startSpinner()
    }
    
    func setSuggestions(with results: [SuggestDataModel]) {
        suggestionResults = results
        self.searchResultView?.stopSpinner()
        mapView?.reloadSuggestions()
    }
    
    func suggestionSelected(with rowIndex: Int) {
        
        guard let position = self.latestLocation else { return }
        guard let country = self.latestCountryCode else { return }
        let selectedData = suggestionResults[rowIndex]
        let selectedResultType = selectedData.resutlType
                
        switch selectedResultType {
            case "categoryQuery","chainQuery" :
                // INFO: AutoSuggest endpoint does not give category id, so i used the href
                self.mapView?.dismissPresentingPlacesList()
                // INFO: Autosuggest is limited to 50, the href also takes the limit, so i had to inject 10 for TOP10
                guard let modifiedUrl = modifyURLQueryString(selectedData.hrefCategory) else { return }
                let query: SearchQuery = .init(hrefCategory: modifiedUrl)
                performSuggestSearch(with: query)
            default:
                // INFO: "Place"
                self.mapView?.dismissPresentingPlacesList()
                let query: SearchQuery = .init(input: selectedData.title, location: position, country: country)
                performSearch(with: query)
        }
    }
    
    func performSearch(with query: SearchQuery) {
        mapView?.removeAnnotations()
        model.fetchSearch(with: query)
    }
    
    func performSuggestSearch(with query: SearchQuery) {
        mapView?.removeAnnotations()
        model.fetchSuggestSearch(with: query)
    }
    
    func setPlaces(with results: [PlacesDataModel]) {
        
        latestPlaces = results.map { searchDataModel -> Places in
            let id = searchDataModel.id
            let title = searchDataModel.title
            let distance = searchDataModel.distance
            let coordinates = CLLocationCoordinate2D(latitude: searchDataModel.position.latitude,
                                                     longitude: searchDataModel.position.longitude)
            let placemark = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark)
            
            return Places(id: id, mapItem: mapItem, title: title, distance: distance, dataModel: searchDataModel)
        }
        
        mapView?.addAnnotations(with: latestPlaces)
        mapView?.presentPlaces(with: latestPlaces)
    }

}
