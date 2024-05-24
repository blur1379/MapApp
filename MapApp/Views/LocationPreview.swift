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
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
            
        }
    }
}

#Preview {
    LocationPreview(location: LocationsDataService.locations.first!)
}
