//
//  MapModelDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

protocol MapModelDelegate: AnyObject {
    
    func didFetchSuggest()
    func didFetchSearch()
    func didFetchLookUp()
    func didFailFetch()
}
