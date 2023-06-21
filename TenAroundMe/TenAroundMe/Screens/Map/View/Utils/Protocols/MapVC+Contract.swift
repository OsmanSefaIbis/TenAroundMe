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
    func configureLocationManager()
    /// suggest
    func reloadSuggestions()
    func setSuggestion(with results: [SuggestDataModel] )
    /// browse
    func removeAnnotations()
    func setPlaces(with results: [PlacesDataModel] )
    func addAnnotations(with places: [Places])
    func presentPlaces(with places: [Places])
    
    func dismissPresentingSuggestionsList()
    func dismissPresentingPlacesList()
    
}

