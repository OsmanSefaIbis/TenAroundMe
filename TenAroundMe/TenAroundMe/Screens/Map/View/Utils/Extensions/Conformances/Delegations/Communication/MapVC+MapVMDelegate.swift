//
//  MapVC+MapVMDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

extension MapVC: MapVMDelegate {
    func didRetrieveSuggest(_ data: [SuggestDataModel]) {
        setSuggestion(with: data)
    }
    
    func didRetrieveSearch(_ data: [SearchDataModel]) {
        setPlaces(with: data)
    }
    
    func didRetrieveDetail(_ data: [DetailDataModel]) {
        print("Implement didRetrieveDetail()")
    }
    

}
