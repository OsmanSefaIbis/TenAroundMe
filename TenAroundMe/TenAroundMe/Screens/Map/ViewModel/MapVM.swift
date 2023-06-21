//
//  MapVM.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation
import CoreLocation
import MapKit

final class MapVM {
    
    lazy var model = MapModel()
    
    weak var mapView: MapVCContract?
    weak var searchResultView: SearchResultsVCContract?
    weak var placesResultView: PlacesResultsVCContract?
    weak var coreDataResultView: CoreDataTableVC?
    weak var delegate: MapVMDelegate?
    
    var timeControl: Timer?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @Flag var isSearchActive
    @Flag var isTypingActive
    @Flag var isNoSuggestion
    @Flag var isNoPlaces
    
    var suggestionResults: [SuggestDataModel] = [ ]
    var suggestionResultsCount: Int { get {suggestionResults.count} }
    
    var latestLocation: Position?
    var latestCountryCode: String?
    var latestPlaces: [Places] = []
    var latestSelectedPlace: Places? // optionalTODO: Focused pin green
    
    init(mapView:MapVCContract) {
        model.delegate = self
        self.mapView = mapView
    }
}
