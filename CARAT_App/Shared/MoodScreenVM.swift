//
//  MoodScreenVM.swift
//  CARAT_App (iOS)
//
//  Created by Rachel Ji on 4/12/22.
//
import Combine
import Foundation
import SwiftUI

class MoodScreenVM: ObservableObject  {
    let dataStore: DataStore
    var cancellables: Set<AnyCancellable> = []
    
    @Published var user: User = User(name: "", email: "", password: "", authenticated: true, currentMood: User.Mood.happy, currentLocation: User.previewData.currentLocation, playlistIds: User.previewData.playlistIds, settings: User.previewData.settings)
//    @Published var mood: User.Mood = User.previewData.currentMood
//    
    //private var userID: Int
    
    init(dataStore: DataStore) {
        self.dataStore = dataStore
        
        dataStore.$user
            .sink{ [weak self] storeUser in
                
           //     if let user = storeUser {
                    self?.user = storeUser
                //}
            }
            .store(in: &cancellables)
    }
    func currentMoodCheck() -> String{
        print("CHECKING")
        return user.currentMood.rawValue
    }
    
    func happyTapped() {
        saveHappy()
    }
    
    func saveHappy() {
        dataStore.updateHappy()
    }
    
    func sadTapped() {
        saveSad()
    }
    
    func saveSad() {
        dataStore.updateSad()
//        print("changed to sad")
//        print(user.currentMood)
    }
    func angryTapped() {
        saveAngry()
    }
    
    func saveAngry() {
        dataStore.updateAngry()
    }
    
    
    func focusTapped() {
        saveFocus()
    }
    
    func saveFocus() {
        dataStore.updateFocus()
    }
    
}



//
//class MoodScreenVM: ObservableObject {
//    let dataStore: DataStore
//
//    init(dataStore: DataStore) {
//
//    }
//
//    func
//}
