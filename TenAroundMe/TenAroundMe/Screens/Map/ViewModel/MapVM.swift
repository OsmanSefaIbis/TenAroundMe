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
    weak var delegate: MapVMDelegate?
    
    var timeControl: Timer?
    
    @Flag var isSearchActive
    @Flag var isTypingActive
    @Flag var isNoSuggestion
    @Flag var isNoPlaces
    
    var suggestionResults: [SuggestDataModel] = [ ]
    var suggestionResultsCount: Int { get {suggestionResults.count} }
    
    var latestLocation: Position?
    
    init(mapView:MapVCContract) {
        model.delegate = self
        self.mapView = mapView
    }
}
