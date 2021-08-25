//
//  MKOverlay+.swift
//  CityDector
//
//  Created by YungCheng Yeh on 2021/8/25.
//

import MapKit

extension MKOverlay {
    func renderer() -> MKOverlayRenderer {
        switch self {
        case let polygon as MKPolygon:
            return MKPolygonRenderer(polygon: polygon)
        case let polygon as MKMultiPolygon:
            return MKMultiPolygonRenderer(multiPolygon: polygon)
        default:
            return MKOverlayRenderer(overlay: self)
        }
    }
}
