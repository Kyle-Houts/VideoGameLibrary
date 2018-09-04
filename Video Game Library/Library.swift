//
//  Library.swift
//  Video Game Library
//
//  Created by Kyle Houts on 9/4/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import Foundation


// This class will handle storing our array of games. It will also handle all of the interactions with that array.
class Library {
    
    // An empty array of Games objects
    private var gameArray: [Game] = [Game(title: "Pikmin 3"), Game(title: "Super Mario Galaxy"), Game(title: "Skyrim"), Game(title: "Crazy Taxi"), Game(title: "Paperboy"), Game(title: "Sonic Boom")]
    
    // MARK:- Functions
    
    func addGame() {
        // When we make a game, we need a title for the game.
        // We need to be able to get user input for the title.
        // We need to create a new game object using that title.
        // We need to add the game to our gameArray.
        // Add input validation to make sure that the input isn't nil or an empty String.
        print("Please enter the title of the game: ")
        var addGameInput: Game?
        addGameInput = Game(title: readLine()!)
        
        gameArray.append(addGameInput!)
        
        // Placeholder: Since we don't have a way to list our games yet, this will go through each game and print the title
        for (n, game) in gameArray.enumerated() {
            print("\(n). \(game.title)")
            
        }
        print("Game added.")
    }
    
    func removeGame() {
        // Add functionality to remove a game from the gameArray
        print("Please enter the number of the title of the game to remove: ")
        var removeGameInput: Int?
        for (n, game) in gameArray.enumerated() {
            print("\(n).  \(game.title)")
        }
        
        removeGameInput = Int(readLine()!)
        
        while removeGameInput! > gameArray.count-1 || removeGameInput! < 0 {
            print("Please enter a valid number.")
            removeGameInput = Int(readLine()!)
        }
        
        gameArray.remove(at: removeGameInput!)
        print("Game removed.")
    }
    
    
    
    func listAvailableGames() {
        // Add functionality to list available games from the gameArray
        for (n, game) in gameArray.enumerated() {
            if game.checkedIn {
                print("\(n). \(game.title)")
            }
        }
    }
    
    
    func listUnavalableGames() {
        // Add functionality to list games checked out of the gameArray and their due dates
        for (n, game) in gameArray.enumerated() {
            if game.checkedIn == false {
                print("\(n). \(game.title)")
            }
        }
    }
    
    
    
    func checkGameOut() {
        //Add functionality to check out games from the available games that aren't checked out from the gameArray and the due date
        
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, YYYY"
        print("Please enter the number of the game you would like to check out: ")
        
        for (n, game) in gameArray.enumerated() {
            if game.checkedIn {
                print("\(n).  \(game.title)")
                
            }
        }
        var checkOutInput = Int(readLine()!)
        
        while checkOutInput! > gameArray.count-1 || checkOutInput! < 0 {
            print("Please enter a valid number.")
            checkOutInput = Int(readLine()!)
        }
        
        
        
        gameArray[checkOutInput!].dueDate = dueDate
        
        
        gameArray[checkOutInput!].checkedIn = false
        print("This game is due back on \(dateFormatter.string(from: dueDate!))")
        
        
    }
    func checkGameIn() {
        // Add functionality to check in games back to the gameArray
        print("Please enter the number of the game you would like to check in: ")
        
        for (n, game) in gameArray.enumerated() {
            if game.checkedIn == false {
                print("\(n).  \(game.title)")
            }
        }
        
        var checkInInput = Int(readLine()!)
        
        while checkInInput! > gameArray.count-1 || checkInInput! < 0 {
            print("Please enter a valid number.")
            checkInInput = Int(readLine()!)
        }
        
        
        
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        gameArray[checkInInput!].dueDate = dueDate
        
        gameArray[checkInInput!].checkedIn = true
        print("Thank you for checkingt his game back in.")
    }
}



