//
//  MainPageView.swift
//  CARAT_App
//
//  Created by Carolina Cassedy on 4/12/22.
//

import SwiftUI



struct MainPageView: View {
    // let user: User
    //    let user: User = User.previewData
    @StateObject var spotifyController = SpotifyController()
    @StateObject var viewModel: MoodScreenVM
    
    
    var body: some View {
        VStack{
            
            Text("Welcome to Spot Sesh")
            //            HStack {
            //            Text("Your mood is: ")
            ////                Text(viewModel.user.currentMood.rawValue)}
            ////                print("user moooood")
            ////                print(viewModel.user.currentMood)
            //                Text(viewModel.user.currentMood.rawValue)}
            //            Spacer()
            //            HStack{
            //            Text("You're at: ")
            //                Text(viewModel.user.currentLocation.name)
            //            }
            //            Spacer()
            
            // extract location
            VStack{
                Image("SpotSesh").resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(6)
                NavigationLink(destination: SpotifyView()) {
                    Text("Start playing music")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .padding(5)
                        .border(Color.black, width: 5)
                        .padding()
                }
                
            }
        }
    }
}

