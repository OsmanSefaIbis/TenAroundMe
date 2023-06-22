//
//  SuggestModel.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

struct SuggestDataModel {
    
    let id: String
    let title: String
    let resutlType: String
    let hrefCategory: String
    let distance: Int
    let categories: [SuggestCategory]
    let chains: [SuggestChain]
}
