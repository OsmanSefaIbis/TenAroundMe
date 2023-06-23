//
//  MockMapVC.swift
//  TenAroundMeTests
//
//  Created by Sefa İbiş on 23.06.2023.
//


@testable import TenAroundMe
import UIKit

final class MockMapVC: MapVCContract {
    
    /// invokation counters to track 
    var counter_assignDelegates = 0
    var counter_configureLocationManager = 0
    var counter_configureMap = 0
    var counter_configureSearchController = 0
    var counter_dismissPresentingPlacesList = 0
    var counter_reloadSuggestions = 0
    var counter_setSuggestion = 0
    var counter_removeAnnotations = 0
    var counter_setPlaces = 0
    var counter_addAnnotations = 0
    var counter_selectAnnotation = 0
    var counter_presentPlaces = 0
    var counter_dismissPresentingSuggestionsList = 0
    var counter_dismissKeyboard = 0
    var counter_presentCoreDataTable = 0
    
    /// Contract
    func assignDelegates() {
        counter_assignDelegates += 1
    }
    func configureMap() {
        counter_configureMap += 1
    }
    
    func configureSearchController() {
        counter_configureSearchController += 1
    }
    
    func configureLocationManager() {
        counter_configureLocationManager += 1
    }
    
    func reloadSuggestions() {
        counter_reloadSuggestions += 1
    }
    
    func setSuggestion(with results: [TenAroundMe.SuggestDataModel]) {
        counter_reloadSuggestions += 1
    }
    
    func removeAnnotations() {
        counter_reloadSuggestions += 1
    }
    
    func setPlaces(with results: [TenAroundMe.PlacesDataModel]) {
        counter_reloadSuggestions += 1
    }
    
    func addAnnotations(with places: [TenAroundMe.Places]) {
        counter_reloadSuggestions += 1
    }
    
    func selectAnnotation(by place: TenAroundMe.Places) {
        counter_reloadSuggestions += 1
    }
    
    func presentPlaces(with places: [TenAroundMe.Places]) {
        counter_reloadSuggestions += 1
    }
    
    func dismissPresentingSuggestionsList() {
        counter_reloadSuggestions += 1
    }
    
    func dismissPresentingPlacesList() {
        counter_dismissPresentingPlacesList += 1
    }
    
    func dismissKeyboard() {
        counter_reloadSuggestions += 1
    }
    
    func presentCoreDataTable() {
        counter_reloadSuggestions += 1
    }
}
