//
//  Places.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import Foundation
import MapKit

class Places: MKPointAnnotation {
    
    let id: String
    let mapItem: MKMapItem
    let placeTitle: String
    let distance: Int
    @Flag var isFocused
    
    init(id: String, mapItem: MKMapItem, title: String, distance: Int) {
        self.id = id
        self.mapItem = mapItem
        self.placeTitle = title
        self.distance = distance
        super.init()
        self.coordinate = mapItem.placemark.coordinate
    }
    
    var name: String {
        mapItem.name ?? ""
    }
    
    var phone: String {
        mapItem.phoneNumber ?? ""
    }
    
    var location: CLLocation {
        mapItem.placemark.location ?? CLLocation.default
    }
    
    var address: String {
        "\(mapItem.placemark.subThoroughfare ?? "") \(mapItem.placemark.thoroughfare ?? "") \(mapItem.placemark.locality ?? "") \(mapItem.placemark.countryCode ?? "")"
    }
}
