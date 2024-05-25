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
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                headerView()
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if location == vm.mapLocation {
                            LocationPreview(location: location)
                                .shadow(color: .black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(
                                    .asymmetric(
                                        insertion: .move(
                                            edge: .trailing
                                        ),
                                        removal: .move(
                                            edge: .leading
                                        )
                                    )
                                )
                        }
                    }
                 
                }
            }
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
}
