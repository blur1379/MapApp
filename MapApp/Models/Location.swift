//
//  Location.swift
//  MapApp
//
//  Created by Mohammad Blur on 5/21/24.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}
