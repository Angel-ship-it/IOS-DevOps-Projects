//
//  TabContainer.swift
//  CARAT_App
//
//  Created by Carolina Cassedy on 4/10/22.
//


//import Foundation
//import SwiftUI
//
//enum Tab {
//    case profile
//    case map
//    case new_playlist
//}
//
//struct TabContainer: View {
//    @State var selectedTab: Tab = .profile
//    @StateObject var spotifyController = SpotifyController()
//
//  var body: some View {
//    Group {
//      TabView(selection: $selectedTab){
//          NavigationView {
//            ProfileScreen()
//          }
//          .tabItem {
//            Label("Profile", systemImage: "person")
//              .accessibility(label: Text("Profile"))
//          }
//          .tag(Tab.profile)
//
//          NavigationView {
//              MapScreenView(viewModel: MapScreenVM(dataStore: DataStore()))
//          }
//          .tabItem {
//            Label("Map", systemImage: "map")
//              .accessibility(label: Text("Map"))
//          }
//          .tag(Tab.map)
//
//        NavigationView {
//            MoodScreen(viewModel: MoodScreenVM(dataStore: DataStore()))
//        }
//        .tabItem {
//          Label("Mood", systemImage: "theatermasks")
//            .accessibility(label: Text(" + Playlist"))
//        }
//        .tag(Tab.new_playlist)
//          NavigationView {
////              MainPageView(user: User.previewData[0])
//              MainPageView(viewModel: MoodScreenVM(dataStore: DataStore()))
//          }
//          .tabItem {
//            Label("Now Playing", systemImage: "music.note")
//              .accessibility(label: Text("Spotify"))
//          }
//          .tag(Tab.profile)
//
//      }
//    }
//    .environmentObject(SpotifyController)
//    .onOpenURL { url in
//        spotifyController.setAccessToken(from: url)
//    }
//    .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
//        spotifyController.connect()
//    })
//  }
//}
//
//struct TabContainer_Previews: PreviewProvider {
//  static var previews: some View {
//    TabContainer()
//  }
//}

import Foundation
import SwiftUI

enum Tab {
    case profile
    case map
    case new_playlist
}

struct TabContainer: View {
    @StateObject var spotifyController = SpotifyController()
    @State var selectedTab: Tab = .profile

  var body: some View {
    Group {
      TabView(selection: $selectedTab){
          NavigationView {
            ProfileScreen()
          }
          .tabItem {
            Label("Profile", systemImage: "person")
              .accessibility(label: Text("Profile"))
          }
          .tag(Tab.profile)

          NavigationView {
            MapScreenView(viewModel: MapScreenVM(dataStore: DataStore()))
          }
          .tabItem {
            Label("Map", systemImage: "map")
              .accessibility(label: Text("Map"))
          }
          .tag(Tab.map)
          
        NavigationView {
          MoodScreen(viewModel: MoodScreenVM(dataStore: DataStore()))
        }
        .tabItem {
          Label("Mood", systemImage: "theatermasks")
            .accessibility(label: Text(" + Playlist"))
        }
        .tag(Tab.new_playlist)
          NavigationView {
            MainPageView(viewModel: MoodScreenVM(dataStore: DataStore()))
          }
          .tabItem {
            Label("Now Playing", systemImage: "music.note")
              .accessibility(label: Text("Spotify"))
          }
          .tag(Tab.profile)

      }
    }
    .environmentObject(spotifyController)
    .onOpenURL { url in
        spotifyController.setAccessToken(from: url)
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
        spotifyController.connect()
    })
  }
}

struct TabContainer_Previews: PreviewProvider {
  static var previews: some View {
    TabContainer()
  }
}
