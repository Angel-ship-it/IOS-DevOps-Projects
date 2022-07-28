import SwiftUI

@main
//here to tell the app what the first screen should be.
struct roommate_partyApp: App {
    let dataStore = DataStore()
    // create a dataStore so now its a real object
    var body: some Scene {
        WindowGroup {
            StatusScreen()
                .environmentObject(StatusScreenViewModel(dataStore : dataStore))
            //put it env so that any view can reach out and grab it
        }
    }
}
