//
//  ContentView.swift
//  CityDector
//
//  Created by YungCheng Yeh on 2021/8/21.
//

import Cocoa
import CoreLocation
import MapKit

class ContentViewController: NSViewController {
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.mapType = .satellite
        view.delegate = self
        
        let overlay = MKTileOverlay()
        overlay.canReplaceMapContent = true
        view.addOverlay(overlay)
        
        return view
    }()
    
    lazy var countries: [Country] = {
        guard
            let path = Bundle.main.url(forResource: "COUNTY_MOI_1090820", withExtension: "geojson"),
            let data = try? Data(contentsOf: path),
            let features = try? MKGeoJSONDecoder().decode(data) as? [MKGeoJSONFeature] else {
            return []
        }
        return features.compactMap(Country.init)
    }()
    
    override func loadView() {
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taipei = MKPointAnnotation()
        taipei.coordinate = CLLocationCoordinate2D(latitude: 25.035915, longitude: 121.563619)
        if let country = countries.first(where: taipei.coordinate.is(in:)) {
            taipei.title = country.name
            mapView.addAnnotation(taipei)
            mapView.addOverlays(country.overlays)
            mapView.visibleMapRect = country.overlays
                .map{$0.boundingMapRect}
                .reduce(MKMapRect.null, +)
        }
    }
}

extension ContentViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = overlay.renderer()
        switch renderer {
        case let renderer as MKPolygonRenderer:
            renderer.fillColor = NSColor.blue
        case let renderer as MKMultiPolygonRenderer:
            renderer.fillColor = NSColor.blue
        default:
            break
        }
        return renderer
    }
}
