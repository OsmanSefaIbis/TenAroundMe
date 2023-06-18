//
//  EndpointTypes.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

public enum EndpointTypes: String {
    
    case browse
    case lookUpById
    case autoSuggest
    
    func get() -> String {
        switch self{
            case .browse: return rawValue
            case .lookUpById: return rawValue
            case .autoSuggest: return rawValue
        }
    }
}
