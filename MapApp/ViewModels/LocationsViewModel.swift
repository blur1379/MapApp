//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Mohammad Blur on 5/21/24.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // current location on map
    @Published var mapLocations: Location
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocations = locations.first!
    }
}
