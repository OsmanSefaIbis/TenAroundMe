//
//  Places.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import Foundation
import MapKit

class Places: MKPointAnnotation {
    
    let id = UUID()
    let mapItem: MKMapItem
    @Flag var isFocused
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
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
