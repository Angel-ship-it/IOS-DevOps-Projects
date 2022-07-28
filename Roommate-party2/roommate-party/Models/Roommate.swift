import Foundation

struct Roommate {
  let name: String
  let me: Bool
  var photoUrl: URL?
  var testStatus: TestStatus = .untested
}

enum TestStatus {
  case untested
  case testedNegative
  case testedPositive
}

extension Roommate {
  static var startingData = [

    Roommate(name: "Monica", me: true,
             photoUrl: URL(string: "https://education-jrp.s3.amazonaws.com/RoommateImages/Monica.png")!),

    Roommate(name: "Rachel", me: false,
             photoUrl: URL(string: "https://education-jrp.s3.amazonaws.com/RoommateImages/Rachel.png")!)
    
  ]
}
