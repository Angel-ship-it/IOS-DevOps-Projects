import SwiftUI

@main
struct Movies_Wk4App: App {
  @StateObject var movieStore = MovieStore()

    var body: some Scene {
        WindowGroup {
            TabContainer()
            .environmentObject(movieStore)
        }
    }
}
