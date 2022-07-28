//
//  MapScreenView.swift
//  CARAT_App
//
//  Created by Carolina Cassedy on 4/12/22.
//

import SwiftUI
import MapKit

struct MapScreenView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.001130691225434, longitude: -78.9380998539665), span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.01))
    @StateObject var viewModel: MapScreenVM

    var body: some View {
        // right now this does not track users but need something in privacy and location settings
        VStack {
        HStack {
//            Spacer()
            Button(action: {viewModel.gardenTapped() }) {
                VStack {
                    Image(systemName:  "leaf.circle.fill")
                        .font(.system(size: 25))
                        .padding()
                }
               // .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
//            .frame(maxWidth: 15)
//            .frame(maxHeight: 15)
          //  .padding()
            Spacer()
            Button(action: {viewModel.bcTapped() }) {
                VStack {
                    Image(systemName:  "figure.wave.circle.fill")
                        .font(.system(size: 25))
              //          .padding()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
//            .frame(maxWidth: 15)
//            .frame(maxHeight: 15)
            //.padding()
            Spacer()
            Button(action: {viewModel.wuTapped() }) {
                VStack {
                    Image(systemName:  "fork.knife.circle.fill")
                        .font(.system(size: 25))
                 //       .padding()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
//            .frame(maxWidth: 15)
//            .frame(maxHeight: 15)
        //    .padding()
            Spacer()
            Button(action: {viewModel.wilsonTapped() }) {
                VStack {
                    Image(systemName:  "drop.circle.fill")
                        .font(.system(size: 25))
            //            .padding()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
//            .frame(maxWidth: 15)
//            .frame(maxHeight: 15)
        //    .padding()
            Spacer()
            Button(action: {viewModel.perkinsTapped() }) {
                VStack {
                    Image(systemName:  "books.vertical.circle.fill")
                        .font(.system(size: 25))
          //              .padding()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
//            .frame(maxWidth: 15)
//            .frame(maxHeight: 15)
        //    .padding()
//            Spacer()
        }
         Spacer()
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: MapLocation.previewData,
            annotationContent: { location in
            MapAnnotation(
               coordinate: location.coordinate,
               content: {
                   Image(systemName: location.image).foregroundColor(.red).font(.system(size: 25))
               }
            )
               })
            Spacer()
            HStack{
                Text("You are located at ")
                Text(viewModel.user.currentLocation.name).fontWeight(.bold)
                
            }
            
        }
            .frame(width: 400, height: 300)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapScreenView(viewModel: MapScreenVM(dataStore: DataStore()))
    }
}
//
//let MapLocations = [
//        MapLocation(name: "Duke Gardens", image: "leaf.circle.fill", latitude: 36.00206809176896, longitude: -78.93136214486445),
//        MapLocation(name: "BC Plaza", image: "figure.wave.circle.fill", latitude: 36.00082256175371, longitude: -78.9400860297186),
//        MapLocation(name: "West Union", image: "fork.knife.circle.fill", latitude: 36.0011567302699, longitude: -78.93890988106902),
//        MapLocation(name: "Wilson Gym", image: "drop.circle.fill", latitude: 35.997632700115425, longitude: -78.9407337832081),
//        MapLocation(name: "Perkins Library", image: "books.vertical.circle.fill", latitude: 36.00226772189659, longitude: -78.93790137047684)
//        ]
//
