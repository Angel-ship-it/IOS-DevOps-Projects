import SwiftUI

struct StatusScreen: View {
    @EnvironmentObject var dataStore:DataStore
  //let roommates = Roommate.startingData
    func partyIsOn()->Bool{
        dataStore.roommates
        .filter{$0.testStatus != .testedNegative}
        .isEmpty
   }

  var body: some View {
    VStack {
      HStack(alignment: .top) {
        VStack {
          Text("Roommate 1")
          Text("No Status Button")
        }
        Spacer()
        VStack {
          Text("Roommate 2")
          Text("Status Button")
        }
      }
      Spacer()
      Text("Party Status")
    }
  }
}

struct StatusScreen_Previews: PreviewProvider {
    static let dataStore = DataStore()
  static var previews: some View {
      
      //StatusScreen()
      
      StatusScreen().environmentObject(dataStore)
  }
}
