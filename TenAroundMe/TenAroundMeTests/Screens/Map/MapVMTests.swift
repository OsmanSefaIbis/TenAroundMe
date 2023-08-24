//
//  MapVMTests.swift
//  TenAroundMeTests
//
//  Created by Sefa İbiş on 23.06.2023.
//


@testable import TenAroundMe
import XCTest

final class MapVMTests: XCTestCase {
    
    private var viewModel: MapVM!
    private var mapView: MockMapVC!
    private var searchResultView: MockSearchResultsVC!
    private var placesResultView: MockPlacesResultsVC!
    
    override func setUp() {
        super.setUp()
        mapView = .init()
        searchResultView = .init()
        placesResultView = .init()
        viewModel = .init(mapView: mapView)
        viewModel.searchResultView = searchResultView
        viewModel.placesResultView = placesResultView
    }
    
    override func tearDown() {
        super.tearDown()
        mapView = nil
        searchResultView = nil
        placesResultView = nil
        viewModel = nil
    }

///Contract

    /// mapView
    func test_viewDidLoad_invokesRequiredSequence() {
        
        XCTAssertEqual(mapView.counter_assignDelegates, 0)
        XCTAssertEqual(mapView.counter_configureLocationManager, 0)
        XCTAssertEqual(mapView.counter_configureMap, 0)
        XCTAssertEqual(mapView.counter_configureSearchController, 0)
        /// given
            viewModel.mapView_viewDidLoad() /// when
        /// then
        XCTAssertEqual(mapView.counter_assignDelegates, 1)
        XCTAssertEqual(mapView.counter_configureLocationManager, 1)
        XCTAssertEqual(mapView.counter_configureMap, 1)
        XCTAssertEqual(mapView.counter_configureSearchController, 1)
    }
    
    /// searchResultView
    func test_viewDidLoad_configuresSearchTable() {
        
        XCTAssertEqual(searchResultView.counter_configureTableView, 0)
            viewModel.searchResultsView_viewDidLoad()
        XCTAssertEqual(searchResultView.counter_configureTableView, 1)
    }
    
    /// placesResultView
    func test_viewDidLoad_configuresResultTable() {
        
        XCTAssertEqual(placesResultView.counter_configureTableView, 0)
            viewModel.placesResultsView_viewDidLoad()
        XCTAssertEqual(placesResultView.counter_configureTableView, 1)
    }
    
    /// mapView
    func test_searchIsDeactivated_dismissPlacesTable() {
        
        XCTAssertEqual(mapView.counter_dismissPresentingPlacesList, 0)
            viewModel.searchIsDeactivated()
        XCTAssertEqual(mapView.counter_dismissPresentingPlacesList, 1)
    }
    
    func test_textDidChange_withInputZero_triggersSuggestionFetch() {
        // TODO: lookup unit testing for timed operation
        XCTAssertEqual(searchResultView.counter_dumpData, 0)
        XCTAssertEqual(mapView.counter_dismissPresentingPlacesList, 0)
            viewModel.textDidChange(with: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1) ) { [weak self] in
            guard let self = self else { return }
            XCTAssertEqual(searchResultView.counter_dumpData, 1)
            XCTAssertEqual(mapView.counter_dismissPresentingPlacesList, 2)
        }
        
    }
    
    func test_textDidChange_withInputNotZero_triggersSuggestionFetch() {
        // TODO: lookup unit testing for timed operation
        XCTAssertEqual(mapView.counter_dismissKeyboard, 0)
        XCTAssertEqual(searchResultView.counter_startSpinner, 0)
            viewModel.textDidChange(with: "Coffee")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self = self else { return }
            XCTAssertEqual(self.mapView.counter_dismissKeyboard, 1)
            XCTAssertEqual(self.searchResultView.counter_startSpinner, 1)
        }
    }
    
    func test_performAutoSuggest_suggestionFetch() {
        XCTAssertEqual(searchResultView.counter_startSpinner, 0)
            viewModel.performAutoSuggest(with: .init())
        XCTAssertEqual(searchResultView.counter_startSpinner, 1)
    }
    
    func test_setSuggestions_reloadSuggestions() {
        XCTAssertEqual(searchResultView.counter_stopSpinner, 0)
        XCTAssertEqual(mapView.counter_reloadSuggestions, 0)
            viewModel.setSuggestions( with: valueFor_setSuggestions )
        XCTAssertEqual(searchResultView.counter_stopSpinner, 1)
        XCTAssertEqual(mapView.counter_reloadSuggestions, 1)
    }
    
    func test_suggestionSelected_withInputCategory_triggersperformSuggestSearch() {
        XCTAssertEqual(mapView.counter_dismissPresentingPlacesList, 0)
        XCTAssertEqual(mapView.counter_removeAnnotations, 0)
            viewModel.suggestionSelected(as: "categoryQuery", with: valueFor_suggestionSelected_category)
        // bug detected, below count should be 1
        XCTAssertEqual(mapView.counter_dismissPresentingPlacesList, 0)
        XCTAssertEqual(mapView.counter_removeAnnotations, 0)
    }
    
    func test_performSearch_triggersFetchForSearch() {
        
        XCTAssertEqual(mapView.counter_removeAnnotations, 0)
            viewModel.performSearch(with: .init())
        XCTAssertEqual(mapView.counter_removeAnnotations, 1)
    }
    
    func test_performSuggestSearch_triggersFetchForSuggestSearch() {
        
        XCTAssertEqual(mapView.counter_removeAnnotations, 0)
            viewModel.performSuggestSearch(with: .init())
        XCTAssertEqual(mapView.counter_removeAnnotations, 1)
    }
    
    func test_setPlaces_performsDataMappingThenPresentsPlaces() {
        
        XCTAssertEqual(mapView.counter_addAnnotations, 0)
        XCTAssertEqual(mapView.counter_presentPlaces, 0)
            viewModel.setPlaces( with: valueFor_setPlaces)
        XCTAssertEqual(mapView.counter_addAnnotations, 1)
        XCTAssertEqual(mapView.counter_presentPlaces, 1)
        
    }
    
    /// dummy objects for the tests
    let valueFor_setSuggestions: [SuggestDataModel] = [.init(id: "", title: "", resutlType: "", href: "", distance: 0, categories: [.init(id: "", name: "", primary: false)], chains: [.init(id: "", name: "")])]
    let valueFor_setPlaces: [PlacesDataModel] = [.init(id: "", title: "", position: Position(latitude: 0, longitude: 0), distance: 0, website: "", phone: "", openHour: "", categories: [.init(id: "", name: "", primary: false)], categoryLabel: "", openingHours: [.init(text: [""], isOpen: false, structured: [.init(start: "", duration: "", recurrence: "")])], address: .init(label: "", countryCode: "", countryName: "", county: "", city: "", district: "", street: "", postalCode: "", houseNumber: ""), addressLabel: "")]
    let valueFor_suggestionSelected_category: SuggestDataModel = .init(id: "", title: "Coffee", resutlType: "categoryQuery", href: "https://autosuggest.search.hereapi.com/v1/discover?in=countryCode%3ATUR&at=41.037437%2C28.985607&q=Coffee&_ontology=coffee&lang=en&limit=10", distance: 0, categories: [], chains: [])
}
    
