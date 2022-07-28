import SwiftUI

struct PerformerList: View {
  @State var performers = Performer.sortedDummyData
  @State var movies = Movie.sortedDummyData
  @State var searchText = ""
  
  var body: some View {
    List(filteredPerformers) { performer in
      PerformerRow(performer: performer, movies: movies)
    }
    .searchable(text: $searchText)
    .navigationTitle("Performers")
  }
  
  var filteredPerformers: [Performer] {
    if searchText.isEmpty {
      return performers
    } else {
      return performers
        .filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
  }
}

struct PerformerRow: View {
  let performer: Performer
  let movies: [Movie]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(performer.name)
      if !filteredMovies.isEmpty {
        Text(filteredMovies)
          .font(.footnote)
          .fontWeight(.bold)
      }
      Group {
        if let daysUntil = daysUntilBirthday {
          Text("🎉 \(daysUntil) days")
        } else {
          Text("no birthday")
        }
      }
      .font(.caption)
    }
  }
  
  var daysUntilBirthday: Int? {
    guard let birthDate = performer.birthDate else { return nil }
    
    var birthdayDateComponents = Calendar.current.dateComponents([.month, .day], from: birthDate)
    let todayDateComponents = Calendar.current.dateComponents([.month, .day, .year], from: Date.now)
    birthdayDateComponents.year = todayDateComponents.year
    var futureBirthday = Calendar.current.date(from: birthdayDateComponents)
    
    if let maybeAlreadyHappenedBirthday = futureBirthday,
       maybeAlreadyHappenedBirthday < Date.now,
       let year = todayDateComponents.year {
      birthdayDateComponents.year = (year + 1)
      futureBirthday = Calendar.current.date(from:birthdayDateComponents)
    }
    
    if let futureBirthday = futureBirthday {
      return Calendar.current.dateComponents([.day], from: Date.now, to: futureBirthday).day
    } else {
      return nil
    }
  }
  
  var filteredMovies: String {
    movies
      .filter {
        $0.performers.contains(performer)
      }
      .map { $0.title }
      .joined(separator: ", ")
  }
  
}

struct PerformerList_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      PerformerList()
    }
  }
}
