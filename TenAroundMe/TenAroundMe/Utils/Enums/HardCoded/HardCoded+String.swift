//
//  HardCoded+String.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//


import Foundation

enum HardCoded: String {
    
    case searchCell, placesCell
    
    func get() -> String {
        
        switch self {
            case .searchCell: return "SearchCell"
            case .placesCell: return "PlacesCell"
        }
    }
}



