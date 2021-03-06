//
//  Library.swift
//  VideoGameLibraryTest
//
//  Created by Kyle Houts on 9/5/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import Foundation


import Foundation


// This class will handle storing our array of games. It will also handle all of the interactions with that array.
class Library {
    
    // An empty array of Games objects
    private var gameArray: [Game] = [
        Game(title: "Pikmin 3"),
        Game(title: "Super Mario Galaxy"),
        Game(title: "Skyrim"),
        Game(title: "Crazy Taxi"),
        Game(title: "Paperboy"),
        Game(title: "Sonic Boom")]
    
    
    
    // MARK:- Functions
    
    func addGame() {
        // When we make a game, we need a title for the game.
        // We need to be able to get user input for the title.
        // We need to create a new game object using that title.
        // We need to add the game to our gameArray.
        // Add input validation to make sure that the input isn't nil or an empty String.
        print("Please enter the title of the game: ")
        var addGameInput: Game?
        addGameInput = Game(title: readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))
        
        gameArray.append(addGameInput!)
        
        // Placeholder: Since we don't have a way to list our games yet, this will go through each game and print the title
        for (i, game) in gameArray.enumerated() {
            print("\(i). \(game.title)")
            
        }
        print("Game added.")
    }
    
    func removeGame() {
        // Add functionality to remove a game from the gameArray
        print("Please enter the number of the title of the game to remove: ")
        var removeGameInput: Int?
        for (i, game) in gameArray.enumerated() {
            print("\(i).  \(game.title)")
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
        for (i, game) in gameArray.enumerated() {
            if game.checkedIn == true {
                print("\(i). \(game.title)")
            }
        }
    }
    
    
    func listUnavailableGames() {
        // Add functionality to list games checked out of the gameArray and their due dates
        for (i, game) in gameArray.enumerated() {
            if game.checkedIn == false {
                print("\(i). \(game.title)")
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
        
        for (i, game) in gameArray.enumerated() {
            if game.checkedIn == true {
                print("\(i).  \(game.title)")
            }
        }
        
        var checkOutInput = Int(readLine()!)
        
        if  gameArray[checkOutInput!].checkedIn == false {
            print("Invalid Input.")
        } else {
            gameArray[checkOutInput!].checkedIn = false
            print("This game is due back on \(dateFormatter.string(from: dueDate!))")
        }
        
        while checkOutInput! > (gameArray.count - 1) || checkOutInput! < 0 {
            print("Please enter a valid number.")
            checkOutInput = Int(readLine()!)
        }
        
        gameArray[checkOutInput!].dueDate = dueDate
        
    }
    
    
    func checkGameIn() {
        // Add functionality to check in games back to the gameArray
        print("Please enter the number of the game you would like to check in: ")
        
        for (i, game) in gameArray.enumerated() {
            if game.checkedIn == false {
                print("\(i).  \(game.title)")
            }
        }
        
        var checkInInput = Int(readLine()!)
        
        while checkInInput! > gameArray.count-1 || checkInInput! < 0 {
            print("Please enter a valid number.")
            checkInInput = Int(readLine()!)
        }
        
        
        
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())!
        
        if Date() > dueDate {
            print("This game is overdue. Please pay your fine.")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, YYYY"
        
        if gameArray[checkInInput!].checkedIn == true {
            print("Invalid Input.")
        } else {
            gameArray[checkInInput!].checkedIn = true
            print("Thank you for checking this game back in.")
        }
    }
    
}







