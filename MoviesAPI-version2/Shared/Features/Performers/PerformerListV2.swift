import SwiftUI

struct PerformerListV2: View {
  @StateObject var viewModel = PerformerListVM()

  var body: some View {
    List(viewModel.filteredPerformers) { performer in
      PerformerRowV2(viewModel: viewModel, performer: performer)
    }
    .searchable(text: $viewModel.searchText)
    .navigationTitle("Performers")
  }
}

struct PerformerRowV2: View {
  @ObservedObject var viewModel: PerformerListVM
  let performer: Performer

  var body: some View {
    VStack(alignment: .leading) {
      Text(performer.name)
      if let movieList = viewModel.movieListFor(performer: performer) {
        Text(movieList)
          .font(.footnote)
          .fontWeight(.bold)
      }
      Text(viewModel.birthdayText(for: performer))
        .font(.caption)
    }
  }
}

struct PerformerListV2_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      PerformerListV2()
    }
  }
}
