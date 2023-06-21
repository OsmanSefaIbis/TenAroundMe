//
//  MapVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import CoreLocation
import MapKit

extension MapVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Core Data ?
        
        if let location = locations.first {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
                guard let self else { return }
                if let country = placemarks?.first?.isoCountryCode {
                    guard let country = Alpha3.alpha2Conversion[country] else { return }
                    viewModel.latestCountryCode = country
                    print(country)
                }
            }
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager,
              let location = locationManager.location else { return }
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2500, longitudinalMeters: 2500)
            map.setRegion(region, animated: true)
        case .denied:
            print("Location service is denied.")
            //TODO: Alert user to enable location.
        case .notDetermined:
            print("Location service is not determined.")
        case .restricted:
            print("Location service is restricted.")
        @unknown default:
            print("Location service is unavailable for an unknown reason.")
        }
    }
}
