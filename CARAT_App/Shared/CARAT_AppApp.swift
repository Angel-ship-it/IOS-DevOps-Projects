//
//  CARAT_AppApp.swift
//  Shared
//
//  Created by Aliya on 2/21/22.
//

import SwiftUI
//@main
//struct CARAT_AppApp: App {
//    @StateObject var spotifyController = SpotifyController()
//        var body: some Scene {
//            WindowGroup {
//                ContentView(viewModel: ViewModel(spotifyController: spotifyController))
//                    .onOpenURL { url in
//                        spotifyController.setAccessToken(from: url)
//                    }
//                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
//                        spotifyController.connect()
//                    })
//            }
//        }
//
//}
@main
struct CARAT_AppApp: App {
        var body: some Scene {
            WindowGroup {
                TabContainer()
            }
        }
    
}

