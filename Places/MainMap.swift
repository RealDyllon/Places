//
//  MainMap.swift
//  Places
//
//  Created by Dyllon on 24/6/22.
//

import SwiftUI
import MapKit
import BottomSheet

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let locations = [
    Location(name: "NTU", coordinate: CLLocationCoordinate2D(latitude: 1.3482407867881148, longitude: 103.68315647687126)),
    Location(name: "Marina Bay Sands", coordinate: CLLocationCoordinate2D(latitude: 1.28051075341345, longitude: 103.85615263822153))
]

struct MainMap: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State var bottomSheetPosition: BottomSheetPosition = .bottom
    
    @State var searchText: String = ""
    
    var body: some View {
        
        Map(coordinateRegion: $mapRegion, annotationItems: locations)
        { location in
            MapMarker(coordinate: location.coordinate)
        }
        .ignoresSafeArea()
        .bottomSheet(
            bottomSheetPosition: self.$bottomSheetPosition,
            options: [
                .cornerRadius(12)],
            headerContent: {
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: self.$searchText)
                    }
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
                    //When you tap the SearchBar, the BottomSheet moves to the .top position to make room for the keyboard.
                    .onTapGesture {
                        self.bottomSheetPosition = .middle
                    }
                    Circle()
                        .fill(.gray)
                        .frame(width: 34, height: 34)
                        .padding(.leading, 4)
                        .padding(.horizontal, 0)
                }
                .padding(.bottom)
                
            }
        ) {
            ScrollView {
                
            }
        }
        
    }
}

struct MainMap_Previews: PreviewProvider {
    static var previews: some View {
        MainMap()
    }
}
