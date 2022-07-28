//
//  ContentView.swift
//  Shared
//
//  Created by Aliya on 2/21/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    let trackIdentifier: String = "spotify:playlist:37i9dQZF1EVJSvZp5AOML2" //happy playlist
//    let trackIdentifier: String = "spotify:playlist:60d30i9AHwd6j9Vorwzaku" //sad library playlist
//    let trackIdentifier: String = "spotify:playlist:5O12S9z3O8dEhHWt3bPbxm" //angry playlist
//    let trackIdentifier: String = "spotify:playlist:3hPeTyReRDrbVqtUHvwfSp" //focus playlist
    
//    USE These track identifiers to play different playlists based on your mood and location

    var body: some View {
        VStack {
            if let image = viewModel.image {
                image
            }
            Button(role: .destructive){
//                have to hit this button after it loads in order for it to work
                viewModel.fetchPlayerState()
//                need to find a way to wait for artwork to fetch
                
                viewModel.fetchArtwork( )
            }
            label:{
                    Text("Loading Spotify Playlist")
                    .font(.caption)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .border(Color.green, width: 4)
                    .padding()
            }
            Button{
                print("Hit the play button")
                viewModel.fetchPlayerState()
                print("player state feteched")
                viewModel.spotifyController.appRemote.playerAPI?.play(trackIdentifier, callback: {_,_ in })
//                viewModel.fetchPlayerState()
            }
        label:{
                Text("Shuffle PLAY")
                .font(.title)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
                .padding(5)
                .border(Color.purple, width: 5)
                .padding()
            }
            .onAppear {
                self.viewModel.fetchPlayerState()
            }
            HStack{
                Button{
                    print("last song")
                    viewModel.spotifyController.appRemote.playerAPI?.skip(toPrevious: {_,_ in })
                    viewModel.fetchPlayerState()
                    viewModel.fetchArtwork( )
                }
            label:{
                Image(systemName: "backward.fill").padding(30)
            }
                Button{
                    print("play song")
                    viewModel.spotifyController.appRemote.playerAPI?.resume({_,_ in })
                    viewModel.fetchPlayerState()
                }
            label:{
                Image(systemName: "play.fill").padding(30)
            }
                Button{
                    print("pause song")
                    viewModel.spotifyController.appRemote.playerAPI?.pause({_,_ in })
                    viewModel.fetchPlayerState()
                }
            label:{
                Image(systemName: "pause.fill").padding(30)
            }
                Button{
                    print("next song")
                    viewModel.spotifyController.appRemote.playerAPI?.skip(toNext: {_,_ in })
                    viewModel.fetchPlayerState()
                    viewModel.fetchArtwork( )
                }
            label:{
                Image(systemName: "forward.fill").padding(30)
            }
                
            }
        }
//        .navigationTitle("Song Currently playing")
    }
}
