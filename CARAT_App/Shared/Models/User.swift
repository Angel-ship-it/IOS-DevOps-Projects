//
//  User.swift
//  CARAT_App (iOS)
//
//  Created by Rachel Ji on 4/12/22.
//


import Foundation

struct User: Identifiable{
    
    var id: String {
        name
    }
    
    let name: String
    var email: String
    var password: String
    var photoUrl: URL?
    var authenticated: Bool
    var currentMood: Mood
    var currentLocation: MapLocation
    var playlistIds: [Int]
    
    enum Mood: String {
        case happy = "Happy"
        case sad = "Sad"
        case angry = "Angry"
        case focus = "Focus"
    }

    var settings: UserSettings

    struct UserSettings: Hashable, Equatable{
        var limit: Int
        var market: String
        var seed_artists: String
        var seed_genres: [String]
        var seed_tracks: String
        var popularity: Int
    }
}

public struct GeneratePlaylist {
    var recommendationVariables: recommendationVariables

    struct recommendationVariables {
        var accousticness: Int
        var danceability: Int
        var energy: Int
        var instrumentalness: Int
        var liveness: Int
        var tempo: Int
        var loudness: Int
    }
}

struct Playlist: Identifiable, Hashable, Equatable {
    var name: String
    var id: Int
    var dateAndTime: Date
    var locationId: Int
}
