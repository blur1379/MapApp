//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Mohammad Blur on 5/21/24.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
