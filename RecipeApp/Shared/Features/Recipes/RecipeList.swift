import SwiftUI

struct RecipeListScreen: View {
  @StateObject var viewModel: RecipeListVM

  var body: some View {
    NavigationView {
      List(viewModel.filteredRecipes) { recipe in
        NavigationLink(destination: RecipeDetailScreen(viewModel: RecipeDetailVM(recipeStore: viewModel.recipeStore, recipeId: recipe.id))) {
          RecipeRow(recipe: recipe)
        }
        .swipeActions(edge: .trailing) {
          Button(role: .destructive) {
            viewModel.deleteRecipe(recipe)
          } label: {
            Label("Delete", systemImage: "trash")
          }
        }
        .navigationTitle("Recipes - jrp96")
      }
      .searchable(text: $viewModel.searchText)
      .disableAutocorrection(true)
//      .navigationViewStyle(StackNavigationViewStyle()) // This quiets a constraint error in logs introduced in Xcode 12.4
    }
  }
}

struct TagView: ViewModifier {
  @Environment(\.colorScheme) private var colorScheme
  private var padding: CGFloat = 3.0
  func body(content: Content) -> some View {
    content
      .padding(EdgeInsets(top: padding, leading: padding*2, bottom: padding, trailing: padding*2))
      .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
      .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
      .cornerRadius(24)
  }
}

struct RecipeRow: View {
  let recipe: Recipe

  var body: some View {
    HStack(alignment: .top) {
      thumbnail
      VStack(alignment: .leading) {
        Text(recipe.mealCourse.rawValue.uppercased()).font(.caption)
        Text(recipe.name)
          .font(.headline)
          .padding(.bottom, 3)
        TagScroller(tags: recipe.tags)
      }
      preparedCheckmark
    }
  }

  var thumbnail: some View {
    AsyncImage(url: recipe.thumbnailUrl) { image in
      image
        .resizable()
        .cornerRadius(6)
    } placeholder: {
      if recipe.thumbnailUrl != nil {
        ProgressView()
      } else {
        Image(systemName: "fork.knife")
      }
    }
    .frame(width: 50, height: 50)
  }

  var preparedCheckmark: some View {
    VStack {
      Spacer()
      Image(systemName: recipe.lastPreparedAt != nil ? "checkmark.circle.fill" : "circle")
        .foregroundColor(recipe.lastPreparedAt != nil ? .red : .black)
      Spacer()
    }
  }
}

struct TagScroller: View {
  let tags: [String]

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(Array(tags), id: \.self) { tag in
          Text(tag)
            .font(.caption)
            .bold()
            .modifier(TagView())
        }
      }
    }
  }
}

struct RecipeList_Previews: PreviewProvider {
  static let recipeStore = RecipeStore()
  static let viewModel = RecipeListVM(recipeStore: recipeStore)
  static var previews: some View {
    Group {
      RecipeListScreen(viewModel: viewModel)
      RecipeListScreen(viewModel: viewModel)
        .preferredColorScheme(.dark)
      RecipeListScreen(viewModel: viewModel)
        .environment(\.sizeCategory, .extraLarge)
    }
  }
}

