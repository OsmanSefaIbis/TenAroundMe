//
//  MapVC+Contract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

protocol MapVCContract: AnyObject {
    
    func assignDelegates()
    /// configureUI
    func configureMap()
    func configureSearchController()
    func configureBottomSheet()
    func configureLocationManager()
    
    /// suggest
    func reloadTableView()
    func setSuggestion(with results: [SuggestDataModel] )
    /// browse
    func removeAnnotations()
    func setPlaces(with results: [SearchDataModel] )
    func addAnnotations(with places: [Places])
    
}

