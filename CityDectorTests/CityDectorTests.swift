//
//  CityDectorTests.swift
//  CityDectorTests
//
//  Created by YungCheng Yeh on 2021/8/26.
//

import XCTest
import MapKit
@testable import CityDector

class CityDectorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMKMapRect() throws {
        let one = MKMapRect(x: 0, y: 0, width: 1, height: 1)
        let half = MKMapRect(x: 1, y: 1, width: 1, height: 1)
        let two = MKMapRect(x: 0, y: 0, width: 2, height: 2)
        XCTAssert(MKMapRectEqualToRect(one, one + MKMapRect.null))
        XCTAssert(MKMapRectEqualToRect(one, one + one))
        XCTAssert(MKMapRectEqualToRect(two, two + one))
        XCTAssert(MKMapRectEqualToRect(two, half + one))
    }
    
    func testMKMapPoint() throws {
        let coordinates = [
            37.1:127,
            37.2:128,
            38.1:128,
            38.2:127
        ].map(CLLocation.init(latitude:longitude:))
        .map{$0.coordinate}
        let polygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
        
        let center = MKMapPoint(CLLocation(latitude: 37.5, longitude: 127.5).coordinate)
        XCTAssert(center.is(in: polygon))
        
        let out = MKMapPoint(CLLocation(latitude: 36, longitude: 127.5).coordinate)
        XCTAssertFalse(out.is(in: polygon))
    }

}
