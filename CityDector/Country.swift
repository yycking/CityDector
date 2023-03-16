//
//  Country.swift
//  CityDector
//
//  Created by Wayne Yeh on 2023/3/16.
//

import Foundation
import MapKit

struct Country {
    let overlays: [MKOverlay]
    private let properties: Property
    
    struct Property: Decodable {
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case name = "COUNTYNAME"
        }
    }
    
    var name: String {
        return properties.name
    }
    
    init?(feature: MKGeoJSONFeature)  {
        guard
            let data = feature.properties,
            let properties = try? JSONDecoder().decode(Property.self, from: data),
            let overlays = feature.geometry as? [MKOverlay]
        else {
            return nil
        }
        self.overlays = overlays
        self.properties = properties
    }
}
