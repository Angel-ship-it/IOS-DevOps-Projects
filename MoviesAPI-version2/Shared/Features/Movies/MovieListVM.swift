import Foundation
import Combine

class MovieListVM: ObservableObject {
  private let movieStore: MovieStore
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var movies: [Movie] = []
  @Published var searchText: String = ""
  
  var filteredMovies: [Movie] {
    if searchText.isEmpty {
      return movies
    } else {
      return movies
        .filter { $0.searchableString.lowercased().contains(searchText.lowercased()) }
    }
  }
  
  init(movieStore: MovieStore) {
    self.movieStore = movieStore
    movieStore.$movies
      .sink{ [weak self] moviesPublishedFromStore in
        self?.movies = moviesPublishedFromStore
      }
      .store(in: &cancellables)
  }
  
  func deleteMovie(_ movie: Movie) {
    movieStore.deleteMovie(movie)
  }
  
}
