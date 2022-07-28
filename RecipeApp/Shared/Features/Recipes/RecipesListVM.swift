import Foundation
import SwiftUI
import Combine

final class RecipeListVM: ObservableObject {
  let recipeStore: RecipeStore
  private var cancellables: Set<AnyCancellable> = []

  @Published var recipes: [Recipe] = []
  @Published var isPresentingEditSheet: Bool = false

  @Published var searchText: String = ""
  var filteredRecipes: [Recipe] {
    if searchText.isEmpty {
      return recipes
    } else {
      return recipes
        .filter { $0.searchableString.contains(searchText.lowercased()) }
    }
  }

  init(recipeStore: RecipeStore) {
    self.recipeStore = recipeStore
    recipeStore.$recipes
          .sink{ [weak self] storeRecipes in
              self?.recipes = storeRecipes
          }
          .store(in: &cancellables)
  }

  func deleteRecipe(_ recipe: Recipe) {
    recipeStore.deleteRecipe(recipe)
  }

}

