//
//  SpotifyView.swift
//  CARAT_App
//
//  Created by Carolina Cassedy on 4/12/22.
//

import SwiftUI


struct SpotifyView: View {
//    @StateObject var spotifyController = SpotifyController()
    @EnvironmentObject var spotifyController: SpotifyController
    
    var body: some View {
        ContentView(viewModel: ViewModel(spotifyController: spotifyController))
//            .onOpenURL { url in
//                spotifyController.setAccessToken(from: url)
//            }
//            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
//                spotifyController.connect()
//            })
    }
}
