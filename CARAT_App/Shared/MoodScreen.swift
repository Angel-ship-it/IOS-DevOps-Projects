//
//  MoodScreen.swift
//  CARAT_App
//
//  Created by Rachel Ji on 4/5/22.
//

import SwiftUI

struct MoodScreen: View {
    @StateObject var viewModel: MoodScreenVM
    
    // Button(action: { viewModel.happyTapped() })
    
    var body: some View {
        VStack{
            Text("How are you feeling today?")
        HStack {
            
            Button(action: {viewModel.happyTapped() }) {
                VStack {
                    Spacer()
                    Image(systemName:  "face.smiling")
                        .font(.system(size: 50))
                        .padding()
                    Text("Happy")
                    Spacer()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
          //  .frame(width: 150, height: 240)
            .frame(maxWidth: 120)
            .frame(maxHeight: 240)
            .padding()
            Button(action: {viewModel.sadTapped() }) {
                VStack {
                    Spacer()
                    Image(systemName:  "bolt.heart")
                        .font(.system(size: 50))
                        .padding()
                    Text("Sad")
                    Spacer()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
            .frame(maxWidth: 120)
            .frame(maxHeight: 240)
            .padding()
        }
        HStack {
            
            Button(action: {viewModel.angryTapped() }) {
                VStack {
                    Spacer()
                    Image(systemName:  "cloud.bolt.rain")
                        .font(.system(size: 50))
                        .padding()
                    Text("Angry")
                    Spacer()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
            .frame(maxWidth: 120)
            .frame(maxHeight: 240)
            .padding()
            Button(action: {viewModel.focusTapped() }) {
                VStack {
                    Spacer()
                    Image(systemName:  "book")
                        .font(.system(size: 50))
                        .padding()
                    Text("Focus")
                    Spacer()
                }
                .padding()
                .accentColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
            .frame(maxWidth: 120)
            .frame(maxHeight: 240)
            .padding()
        }
            HStack{
                Text("You are feeling ")
                Text(viewModel.user.currentMood.rawValue).fontWeight(.bold)
                
            }
    }
    }
}


struct MoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        MoodScreen(viewModel: MoodScreenVM(dataStore: DataStore()))
    }
}
