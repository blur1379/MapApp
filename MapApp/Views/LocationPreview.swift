//
//  LocationPreview.swift
//  MapApp
//
//  Created by Mohammad Blur on 5/24/24.
//

import SwiftUI

struct LocationPreview: View {
    
    let location: Location
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LocationPreview(location: LocationsDataService.locations.first!)
}
