//
//  CoreDataModel.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 21.06.2023.
//

import Foundation

public struct CoreDataModel{
    
    static var nextId: Int64 = 1
    let id: Int64
    let latitude: Double
    var longitude: Double
    var timestamp: Date
    
    init(latitude: Double, longitude: Double, timestamp: Date) {
        id = CoreDataModel.nextId
        CoreDataModel.nextId += 1
        self.latitude = latitude
        self.longitude = longitude
        self.timestamp = timestamp
    }
    
    init(id: Int64, latitude: Double, longitude: Double, timestamp: Date) {
        CoreDataModel.nextId += 1
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.timestamp = timestamp
    }
    
    static func resetId() {
        CoreDataModel.nextId = 1
    }
    static func setNextId(with initiateWithID: Int64) {
        CoreDataModel.nextId = initiateWithID
    }
}
