//
//  ProfileScreen.swift
//  CARAT_App (iOS)
//
//  Created by Aliya on 4/11/22.
//

import SwiftUI

struct ProfileScreen: View {
//    @State var user = User.previewData

    var body: some View {
        VStack {
            VStack{
                Image(systemName:  "person").padding().font(.system(size: 100))
//                Text(user.name.uppercased())
            }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 30).fill(.green)).overlay(RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(.green, lineWidth: 3))
                Spacer()
            Text("Jon")
                Text("Email: jrp95@duke.edu")
            Spacer()
            Text("Save").padding(20)
                .background(RoundedRectangle(cornerRadius: 30).fill(.yellow)).overlay(RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(.yellow, lineWidth: 3))
              }
        }
    }

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
