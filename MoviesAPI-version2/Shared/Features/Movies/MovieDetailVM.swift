import Foundation
import Combine

class MovieDetailVM: ObservableObject {
  enum State {
    case loading
    case loaded
  }
  private var movieStore: MovieStore
  private var cancellables: Set<AnyCancellable> = []
  private var movieId: Int

  @Published var movie: Movie = Movie(id: 0, title: "Loading", genre: .comedy)
  @Published var state: State = .loading
  @Published var editSheetIsPresenting: Bool = false

  init(movieStore: MovieStore, movieId: Int) {
    self.movieStore = movieStore
    self.movieId = movieId

    movieStore.$movies
      .sink{ [weak self] storeMovies in
        if let movie = storeMovies.filter({ $0.id == self?.movieId }).first {
          self?.movie = movie
          self?.state = .loaded
        }
      }
      .store(in: &cancellables)
  }

  var castMembers: [Performer] {
    movie.performers.sorted { $0.sortableName < $1.sortableName }
  }

  func editButtonTapped() {
    self.editSheetIsPresenting = true
  }

  func viewedButtonTapped() {
    movie.viewed = (movie.viewed ? false : true)
    saveMovie()
  }

  func toggleSwitched() {
    saveMovie()
  }

  func saveMovie() {
    movieStore.updateMovie(movie)
  }
}
