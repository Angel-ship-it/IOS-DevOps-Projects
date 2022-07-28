import Foundation
import SwiftUI
import Combine

final class RecipeDetailVM: ObservableObject {
  enum State {
    case loading
    case loaded
  }

  private var recipeStore: RecipeStore
  private var cancellables: Set<AnyCancellable> = []
  var recipeId: UUID

  @Published var state: State = .loading
  @Published var recipe: Recipe = Recipe(name:"Loading", mealCourse: .mainDish)
  @Published var isPresentingEditSheet: Bool = false
  @Published var recipeScale = Recipe.Scale.one

  init(recipeStore: RecipeStore, recipeId: UUID) {
    self.recipeStore = recipeStore
    self.recipeId = recipeId

    self.state = .loading
    recipeStore.$recipes
      .sink{ [weak self] storeRecipes in
        if let recipe = storeRecipes.filter({ $0.id == recipeId }).first {
          self?.recipe = recipe
          self?.state = .loaded
        }
      }
      .store(in: &cancellables)
  }

  func toggleLastPreparedAt() {
    if recipe.lastPreparedAt != nil {
      recipe.lastPreparedAt = nil
    } else {
      recipe.lastPreparedAt = Date.now
    }
    updateRecipe()
  }

  func componentDisplay(_ recipeComponent: RecipeComponent) -> String {
    [
      recipeComponent.quantity.map { String($0 * recipeScale.rawValue) } ?? "",
      recipeComponent.unit.map { String($0) } ?? "",
      recipeComponent.ingredient.name
    ]
      .filter { !$0.isEmpty }
      .joined(separator: " ")
  }

  func updateRecipe() {
    recipeStore.updateRecipe(recipe)
  }

}
