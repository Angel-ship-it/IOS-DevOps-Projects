//
//  Locations.swift
//  CARAT_App
//
//  Created by Carolina Cassedy on 4/12/22.
//

import SwiftUI
import MapKit

struct MapLocation: Identifiable {
    var id: String {
        name
    }
    // let id: Int
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
