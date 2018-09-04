//
//  Game.swift
//  Video Game Library
//
//  Created by Kyle Houts on 9/4/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import Foundation


// This is the data model that represents our games that will be stored in the library.
class Game {
    
    // This will store the title of the game.
    var title: String
    
    // We are going to set this true by default because when a new game is created, we are going to assume that it is check in.
    var checkedIn = true
    
    // This is optional because if a game isn't checked out, it shouldn't have a due date.
    var dueDate: Date?
    
    // Since checkedIn has a default value and dueDate ins an optional, the only value that we have to initialize is the title.
    init(title: String) {
        self.title = title
    }
}






