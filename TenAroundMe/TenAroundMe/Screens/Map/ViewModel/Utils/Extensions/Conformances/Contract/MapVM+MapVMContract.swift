//
//  MapVM+MapVMContract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

extension MapVM: MapVMContract {
    
    func mapView_viewDidLoad() {
        mapView?.configureMap()
        mapView?.configureSearchController()
        mapView?.configureBottomSheet()
    }
    func searchResultsView_viewDidLoad() {
        searchResultView?.configureTableView()
    }
}
