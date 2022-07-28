import SwiftUI

@main
struct RecipeStashApp: App {
  @StateObject var recipeStore = RecipeStore() // This could also be an environmentObject
  
  var body: some Scene {
    WindowGroup {
      RecipeListScreen(viewModel: RecipeListVM(recipeStore: recipeStore))
    }
  }
}
