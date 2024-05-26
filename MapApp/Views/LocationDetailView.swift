//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Mohammad Blur on 5/25/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSession()
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                titleSession()
                Divider()
                descriptionSession()
                Divider()
                mapLayer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton()
        }
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView {
    
    @ViewBuilder
    private func imageSession() -> some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    @ViewBuilder
    private func titleSession() -> some View {
        VStack(alignment: .leading, spacing: 16){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    @ViewBuilder
    private func descriptionSession() -> some View {
        VStack(alignment: .leading, spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline )
                    .tint(.blue)
            }
        }
    }
    
    @ViewBuilder
    private func mapLayer() -> some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: location.coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    @ViewBuilder
    private func backButton() -> some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }

    }
    
}
