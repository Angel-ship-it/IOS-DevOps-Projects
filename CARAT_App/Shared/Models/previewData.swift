//
//  PreviewData.swift
//  CARAT_App (iOS)
//
//  Created by Aliya on 3/24/22.
//

import Foundation

// lat and long is wrong for now!
extension MapLocation {
  static let previewData = [
    MapLocation(name: "Perkins Library", image: "books.vertical.circle.fill", latitude: 36.00226772189659, longitude: -78.93790137047684),
    MapLocation(name: "West Union", image: "fork.knife.circle.fill", latitude: 36.0011567302699, longitude: -78.93890988106902),
    MapLocation(name: "Duke Gardens",image: "leaf.circle.fill", latitude: 36.00206809176896, longitude: -78.93136214486445),
    MapLocation(name: "BC Plaza", image: "figure.wave.circle.fill", latitude: 36.00082256175371, longitude: -78.9400860297186),
    MapLocation(name: "Wilson", image: "drop.circle.fill", latitude: 35.997632700115425, longitude: -78.9407337832081)
  ]
}

extension User {
    static let previewData =
    User(name: "Carat", email: "carat@gmail.com", password: "carat123", authenticated: true, currentMood: Mood.happy, currentLocation: MapLocation(name: "Perkins Library", image: "books.vertical.circle.fill", latitude: 36.00226772189659, longitude: -78.93790137047684), playlistIds: [1,2,3,4,5,6],
             settings: UserSettings(limit: 10, market: "US", seed_artists: "", seed_genres: ["jazz","country,hip-hop"], seed_tracks: "", popularity: 5)) 
}
extension Playlist{
    static let previewData = [
        Playlist(name: "jazz at the gardens!", id: 1, dateAndTime: Date.distantPast, locationId: 3),
        Playlist(name: "chill focus", id: 2, dateAndTime: Date.distantPast, locationId: 1),
        Playlist(name: "Eating alone?!", id: 3, dateAndTime: Date.distantPast, locationId: 2),
        Playlist(name: "sunny bc days", id: 4, dateAndTime: Date.distantPast, locationId: 4),
        Playlist(name: "hip hop run", id: 5, dateAndTime: Date.distantPast, locationId: 5),
        Playlist(name: "dance study!", id: 6, dateAndTime: Date.distantPast, locationId: 1)
        ]
}
