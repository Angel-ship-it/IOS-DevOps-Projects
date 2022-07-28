import Combine
import Foundation
import SwiftUI

class MapScreenVM: ObservableObject  {
    let dataStore: DataStore
    var cancellables: Set<AnyCancellable> = []
    
    @Published var user: User = User(name: "", email: "", password: "", authenticated: true, currentMood: User.Mood.happy, currentLocation: User.previewData.currentLocation, playlistIds: User.previewData.playlistIds, settings: User.previewData.settings)
//    @Published var mood: User.Mood = User.previewData.currentMood
//    @Published var location: MapLocation = User.previewData.currentLocation
    
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
//    func currentMoodCheck() -> String{
//        print("CHECKING")
//        return user.currentMood.rawValue
//    }
    
    func gardenTapped() {
        saveGarden()
    }
    
    func saveGarden() {
        dataStore.updateGardens()
    }
    
    func bcTapped() {
        saveBC()
    }
    
    func saveBC() {
        dataStore.updateBC()
//        print("changed to sad")
//        print(user.currentMood)
    }
    func wuTapped() {
        saveWU()
    }
    
    func saveWU() {
        dataStore.updateWU()
    }
    
    
    func wilsonTapped() {
        saveWilson()
    }
    
    func saveWilson() {
        dataStore.updateWilson()
    }
    
    func perkinsTapped() {
        savePerkins()
    }
    
    func savePerkins() {
        dataStore.updatePerkins()
    }
    
    
}



