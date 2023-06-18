//
//  MapVM.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

final class MapVM {
    
    lazy var model = MapModel()
    
    weak var mapView: MapVCContract?
    weak var searchResultView: SearchResultsVCContract?
    weak var delegate: MapVMDelegate?
    
    var searchResults: [SearchCellModel] = [
        .init(resultName: "N 1"),
    ]
    var searchResultsCount: Int { get {searchResults.count} }
    
    init(mapView:MapVCContract) {
        model.delegate = self
        self.mapView = mapView
    }
}
