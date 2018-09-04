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
    private var gameArray: [Game] = [Game(title: "Pikmin 3"), Game(title: "Super Mario Galaxy"), Game(title: "Skyrim"), Game(title: "Crazy Taxi"), Game(title: "Paperboy")]
    
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
        for game in gameArray {
            print(game.title)
        }
    }
    
    func removeGame() {
        // TODO:- Add functionality to remove a game from the gameArray
        print("Please enter the number of the title of the game to remove: ")
        for (n, game) in gameArray.enumerated() {
            print("\(n + 1).  \(game.title)")
        }
        var removeGameInput: Int?
        removeGameInput = Int(readLine()!)
        gameArray.remove(at: removeGameInput!)
        //            if removeGameInput! > (n + 1) {
        //                print("Please choose a valid number")
    }
    
    
    
    func listAvailableGames() {
        // Add functionality to list available games from the gameArray
        for game in gameArray {
            print(game.title)
        }
    }
    
    
    func listUnavalableGames() {
        // TODO:- Add functionality to list games checked out of the gameArray and their due dates
        
    }
    
    
    func checkGameOut() {
        //TODO:- Add functionality to check out games from the available games that aren't checked out from the gameArray and the due date
        
    }
    
    
    func checkGameIn() {
        //TODO:- Add functionality to check in games back to the gameArray
        
    }
    
}

