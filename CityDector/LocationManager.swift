//
//  LocationManager.swift
//  CityDector
//
//  Created by YungCheng Yeh on 2021/8/21.
//

import Foundation
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()
    @Published var status: CLAuthorizationStatus?
    @Published var coordinate: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        guard let location = locations.last else { return }
        self.coordinate = location.coordinate
    }
}
