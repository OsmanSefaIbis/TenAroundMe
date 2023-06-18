//
//  Coordinate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import Foundation

public struct Position {
    
    let latitude: Double
    let longitude: Double
    
    func get() -> String {
        "\(latitude),\(longitude)"
    }
}

