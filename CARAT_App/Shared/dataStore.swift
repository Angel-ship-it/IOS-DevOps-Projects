//
//  dataStore.swift
//  CARAT_App (iOS)
//
//  Created by Rachel Ji on 4/12/22.
//

import Foundation
import SwiftUI

class DataStore: ObservableObject  {
    @Published var locations: [MapLocation] = MapLocation.previewData
    @Published var user: User = User.previewData
    @Published var playlists: [Playlist] = Playlist.previewData
    
    func createPlaylist(_ playlist: Playlist) {
        playlists.append(playlist)
    }
    
    func updateHappy() {
        user.currentMood = .happy
        print(user.currentMood)
    }
    func updateSad() {
        user.currentMood = .sad
        print(user.currentMood)
    }
    func updateAngry() {
        user.currentMood = .angry
        print(user.currentMood)
    }
    func updateFocus() {
        user.currentMood = .focus
        print(user.currentMood)
    }
    
    
    func updateGardens() {
        user.currentLocation = MapLocation(name: "Duke Gardens",image: "leaf.circle.fill", latitude: 36.00206809176896, longitude: -78.93136214486445)
        print(user.currentLocation)
    }
    func updateWU() {
        user.currentLocation = MapLocation(name: "West Union", image: "fork.knife.circle.fill", latitude: 36.0011567302699, longitude: -78.93890988106902)
        print(user.currentLocation)
    }
    func updateBC() {
        user.currentLocation = MapLocation(name: "BC Plaza", image: "figure.wave.circle.fill", latitude: 36.00082256175371, longitude: -78.9400860297186)
        print(user.currentLocation)
    }
    func updateWilson() {
        user.currentLocation = MapLocation(name: "Wilson", image: "drop.circle.fill", latitude: 35.997632700115425, longitude: -78.9407337832081)
        print(user.currentLocation)
    }
    func updatePerkins() {
        user.currentLocation = MapLocation(name: "Perkins Library", image: "books.vertical.circle.fill", latitude: 36.00226772189659, longitude: -78.93790137047684)
        print(user.currentLocation)
    }
    
//    func updateUser(_ user: User) {
//        if let index = user.firstIndex( where: {$0.id == user.id}) {
//            user[index] = user
//        }
//    }
}
