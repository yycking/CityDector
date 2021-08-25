//
//  MKMapRect+.swift
//  CityDector
//
//  Created by YungCheng Yeh on 2021/8/25.
//

import MapKit

extension MKMapRect {
    static func + (lhs: MKMapRect, rhs: MKMapRect) -> MKMapRect {
        return lhs.union(rhs)
    }
}
