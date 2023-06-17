//
//  MapVM.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

final class MapVM {
    
    lazy var model = MapModel()
    
    weak var view: MapVCContract?
    weak var delegate: MapVMDelegate?
    
    var searchResults: [SearchCellModel] = [
        .init(resultName: "N 1"),
        .init(resultName: "N 2"),
        .init(resultName: "N 3"),
        .init(resultName: "N 4"),
        .init(resultName: "N 5"),
        .init(resultName: "N 6"),
        .init(resultName: "N 7"),
        .init(resultName: "N 8"),
        .init(resultName: "N 9"),
        .init(resultName: "N 10"),
        .init(resultName: "N 11"),
        .init(resultName: "N 12"),
        .init(resultName: "N 13"),
        .init(resultName: "N 14"),
        .init(resultName: "N 15"),
    ]
    var searchResultsCount: Int { get {searchResults.count} }
    
    init(view:MapVCContract) {
        model.delegate = self
        self.view = view
    }
}
