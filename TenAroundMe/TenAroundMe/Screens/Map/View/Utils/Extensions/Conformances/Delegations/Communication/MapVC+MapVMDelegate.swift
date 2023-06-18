//
//  MapVC+MapVMDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

extension MapVC: MapVMDelegate {
    func didRetrieveSuggest(_ data: [SuggestDataModel]) {
        setSuggestion(data)
    }
    
    func didRetrieveSearch(_ data: [SearchDataModel]) {
        print("Implement didRetrieveSearch()")
    }
    
    func didRetrieveDetail(_ data: [DetailDataModel]) {
        print("Implement didRetrieveDetail()")
    }
    

}
