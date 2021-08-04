//
//  LocationManager.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 3.08.2021.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    private let manager = CLLocationManager()
    
    var locationUpdated: ((CLLocationCoordinate2D?) -> Void)?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        if manager.authorizationStatus != .authorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        } else {
            manager.requestLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationUpdated?(locations.first?.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Error: \(error)")
    }
}
