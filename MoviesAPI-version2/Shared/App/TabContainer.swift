import SwiftUI

enum Tab {
  case movies
  case actors
}

struct TabContainer: View {
  @EnvironmentObject var movieStore: MovieStore
  @State var selectedTab: Tab = .movies

  var body: some View {
    Group {
      TabView(selection: $selectedTab){

        NavigationView {
          MovieList(viewModel: MovieListVM(movieStore: movieStore))
        }
        .tabItem {
          Label("Movies", systemImage: "film")
            .accessibility(label: Text("Movies"))
        }
        .tag(Tab.movies)

        NavigationView {
          PerformerListV2()
        }
        .tabItem {
          Label("Performers", systemImage: "person")
            .accessibility(label: Text("Performers"))
        }
        .tag(Tab.actors)

      }
    }
  }
}

struct TabContainer_Previews: PreviewProvider {
  static var previews: some View {
    TabContainer()
  }
}
