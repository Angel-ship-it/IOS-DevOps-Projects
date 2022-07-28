//
//  StatusScreenViewModel.swift
//  roommate-party
//
//  Created by Angel Mcharo on 03/02/2022.
//

import SwiftUI
import Combine
class StatusScreenViewModel: ObservableObject{
    let dataStore: DataStore
    @Published var roommates: [Roommate]=[]
    //this wont change the array it will just publish a new array with changes that we will see bcoz we have subscribed to new array.
    var cancellables: Set<AnyCancellable> = []
    
    init(dataStore: DataStore){
        self.dataStore=dataStore
        dataStore.$roommates
            .sink{[weak self] roommatesUpdate in
                //sink means subscribe to roomateUpdates
                self?.roommates=roommatesUpdate
            }
            .store(in : &cancellables)
    }
}

