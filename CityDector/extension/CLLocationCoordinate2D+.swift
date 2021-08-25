//
//  CLLocationCoordinate2D+.swift
//  CityDector
//
//  Created by YungCheng Yeh on 2021/8/25.
//

import CoreLocation
import MapKit

extension CLLocationCoordinate2D {
    func `is`(in country: Country) -> Bool {
        let point = MKMapPoint(self)
        
        return country.overlays.contains(where: point.is(in:))
    }
}
