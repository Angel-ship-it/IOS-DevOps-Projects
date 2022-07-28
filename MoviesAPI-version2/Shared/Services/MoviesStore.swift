import Combine

class MovieStore: ObservableObject  {
  @Published var movies: [Movie] = Movie.sortedDummyData

  func createMovie(_ movie: Movie) {
    movies.append(movie)
  }

  func updateMovie(_ movie: Movie) {
    if let index = movies.firstIndex(where: { $0.id == movie.id }) {
      movies[index] = movie
    }
  }

  func deleteMovie(_ movie: Movie) {
    if let index = movies.firstIndex(where: { $0.id == movie.id }) {
      movies.remove(at: index)
    }
  }
}
