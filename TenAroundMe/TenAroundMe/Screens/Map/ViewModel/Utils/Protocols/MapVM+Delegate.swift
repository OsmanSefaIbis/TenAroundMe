//
//  MapVM+Delegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

protocol MapVMDelegate: AnyObject {
    
    func didRetrieveSuggest(_ data: [SuggestDataModel])
    func didRetrieveSearch(_ data: [PlacesDataModel])
    func didRetrieveDetail(_ data: [DetailDataModel])
//    func didConnectionHalt(_ prompt: String)
}
