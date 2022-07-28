//
//  dataStore.swift
//  roommate-party
//
//  Created by Angel Mcharo on 03/02/2022.
//

import Combine

class DataStore : ObservableObject{
    //published is announcing that the data has changed to all views that will see this
    @Published var roommates = Roommate.startingData
}
