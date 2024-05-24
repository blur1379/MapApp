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
        VStack(spacing: 16) {
            
            imageSession()
            
            titleSession()
            
        }
    }
}

#Preview {
    LocationPreview(location: LocationsDataService.locations.first!)
}

extension LocationPreview {
    
    @ViewBuilder
    func imageSession() -> some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.red)
        .cornerRadius(10)
    }
    
    @ViewBuilder
    func titleSession() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
}
