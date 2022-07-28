import SwiftUI

struct MovieList: View {
  @EnvironmentObject var movieStore: MovieStore
  @StateObject var viewModel: MovieListVM

  var body: some View {
    List(viewModel.filteredMovies) { movie in
      NavigationLink(destination: MovieDetail(
        viewModel: MovieDetailVM(movieStore: movieStore, movieId: movie.id)
      )) {
        MovieRow(movie: movie)
      }
      .swipeActions(edge: .trailing) {
        Button(role: .destructive) {
          viewModel.deleteMovie(movie)
        } label: {
          Label("Delete", systemImage: "trash")
        }
      }
    }
    .navigationTitle("Movies - jrp96")
    .searchable(text: $viewModel.searchText)
  }

}

struct MovieRow: View {
  let movie: Movie

  var body: some View {
    HStack {
      AsyncImage(url: movie.posterUrl) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
      } placeholder: {
        if movie.posterUrl != nil {
          ProgressView()
        } else {
          Image(systemName: "film.fill")
        }
      }
      .frame(maxWidth: 100, maxHeight: 100)
      Text(movie.title)
      Spacer()
      Image(systemName: movie.viewed ? "checkmark.circle.fill" : "circle")
        .foregroundColor(movie.viewed ? Color.green : Color.black)
    }
  }
}


struct MovieList_Previews: PreviewProvider {
  static let movieStore = MovieStore()
  static var previews: some View {
    MovieList(viewModel: MovieListVM(movieStore: movieStore))
  }
}
