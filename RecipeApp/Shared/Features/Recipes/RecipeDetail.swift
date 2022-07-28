import SwiftUI

struct RecipeDetailScreen: View {
  @StateObject var viewModel: RecipeDetailVM
  
  var body: some View {
    Group {
      switch viewModel.state {
      case .loading:
        ProgressView()
      case .loaded:
        RecipeDetail(viewModel: viewModel)
          .toolbar {
            ToolbarItem(placement: .primaryAction) {
              Button("Edit") { viewModel.isPresentingEditSheet = true }
            }
          }
          .sheet(isPresented: $viewModel.isPresentingEditSheet) {
            RecipeForm(viewModel: viewModel)
          }
      }
    }
  }
}

struct RecipeDetail: View {
  @ObservedObject var viewModel: RecipeDetailVM

  var body: some View {
    ScrollView {
      VStack {
        recipeImage
        Text(viewModel.recipe.name).font(.headline)
        Button(action: { viewModel.toggleLastPreparedAt() }) {
          HStack(spacing: 4) {
            Text("Previously Prepared")
            viewModel.recipe.lastPreparedAt != nil ? Image(systemName: "checkmark.circle") : Image(systemName: "circle")
          }
        }
        VStack(alignment: .leading) {
          ForEach(viewModel.recipe.componentSections, id: \.self) { sectionLabel in
            Text(sectionLabel)
              .bold()
              .padding(.top, 6)
            ForEach(viewModel.recipe.componentsForSection(sectionLabel), id: \.self) { component in
              Text(viewModel.componentDisplay(component))
            }
          }
          ForEach(viewModel.recipe.unsectionedComponents) { component in
            Text(viewModel.componentDisplay(component))
          }
          .padding(.top, 6)
          ForEach(viewModel.recipe.instructions.sorted(by: { $0.position < $1.position }), id: \.self) { instruction in
            Text(instruction.instructionText)
              .padding(.top, 6)
          }
        }
      }
      .padding(12)
      Spacer()
    }
  }

  var recipeImage: some View {
    AsyncImage(url: viewModel.recipe.thumbnailUrl) { image in
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 200)
    } placeholder: {
      if viewModel.recipe.thumbnailUrl != nil {
        ProgressView()
      } else {
        Image(systemName: "fork.knife")
      }
    }
  }
}

struct RecipeForm: View {
  @ObservedObject var viewModel: RecipeDetailVM
  var body: some View {
    NavigationView {
      VStack {
        Text("Scale")
          .font(.headline)
        Picker("Recipe Scale", selection: $viewModel.recipeScale) {
          ForEach(Recipe.Scale.allCases, id: \.self) { value in
            Text(value.localizedDescription)
              .tag(value)
          }
        }
        .pickerStyle(.wheel)
      }
      .padding()
      .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(white: 0.9)))
      .padding(30)
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button("Done") { viewModel.isPresentingEditSheet = false }
        }
      }
    }
  }
}

struct RecipeDetail_Previews: PreviewProvider {
  static let recipeStore = RecipeStore()
  static let viewModel = RecipeDetailVM(recipeStore: recipeStore, recipeId: Recipe.previewData[0].id)
  static var previews: some View {
    RecipeDetailScreen(viewModel: viewModel)
  }
}
