//
//  MKMapPoint+.swift
//  CityDector
//
//  Created by YungCheng Yeh on 2021/8/25.
//

import MapKit

extension MKMapPoint {
    func `is`(in overlay: MKOverlay) -> Bool {
        let render = overlay.renderer()
        let point = render.point(for: self)
        
        switch render {
        case let render as MKOverlayPathRenderer:
            return render.path.contains(point)
        default:
            return false
        }
    }
}
