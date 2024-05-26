//
//  LocationsView.swift
//  MapApp
//
//  Created by Mohammad Blur on 5/21/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                headerView()
                    .padding()
                Spacer()
                locationPreviewStack()
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    
    @ViewBuilder
    func headerView() -> some View {
        VStack(spacing: 0) {
            
            Button(action: vm.toggleLocationList, label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(vm.showLocationList ? Angle(degrees: 180) : .zero )
                    }
            })
            
            if vm.showLocationList {
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    @ViewBuilder
    func mapLayer() -> some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(location == vm.mapLocation ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    @ViewBuilder
    private func locationPreviewStack() -> some View {
        ZStack {
            ForEach(vm.locations) { location in
                if location == vm.mapLocation {
                    LocationPreview(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            ))
                }
            }
        }
    }
}
