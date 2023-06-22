//
//  HardCoded+String.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//


import Foundation

enum HardCoded: String {
    
    case searchCell, placesCell, offlinePrompt, offLineAlertTitlePrompt, offLineActionTitlePrompt
    
    func get() -> String {
        
        switch self {
            case .searchCell: return "SearchCell"
            case .placesCell: return "PlacesCell"
            case .offlinePrompt: return "Turn on mobile data or connect to Wi-Fi"
            case .offLineAlertTitlePrompt: return "No internet connection"
            case .offLineActionTitlePrompt: return "Ok"
        }
    }
}

