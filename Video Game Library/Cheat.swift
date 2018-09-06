//
//  Cheat.swift
//  VideoGameLibraryTest
//
//  Created by Kyle Houts on 9/5/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import Foundation

class SecretLibrary {
    
    
    // secretGameArray for cheat
    private var secretGameArray: [Game] = [
        Game(title: "Elmo in Mordor"),
        Game(title: "Pokemon Centipede"),
        Game(title: "The Great Emu War")]
    
    var shouldQuit = false
    
    func quit() {
        shouldQuit = true
        print("Thanks for coming")
    }
    
    
    func validateInput (_ input: String) -> Bool {
        let menuOptions = Array(1...8)
        
        guard let number = Int(input) else {return false}
        
        return menuOptions.contains(number)
    }
    
    
    func getInput() -> String {
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            if line != "" {
                input = line
                
            } else {
                print("Invalid input.")
            }
        } while input == nil
        return input!
    }
    
    
    func addSecretGame() {
        
        print("Please enter the title of the secret game: ")
        var addGameInput: Game?
        addGameInput = Game(title: readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))
        
        secretGameArray.append(addGameInput!)
        
        for (i, game) in secretGameArray.enumerated() {
            print("\(i). \(game.title)")
            
        }
        print("Secret game added.")
    }
    
    
    func removeSecretGame() {
        
        print("Please enter the number of the title of the secret game to remove: ")
        var removeGameInput: Int?
        for (i, game) in secretGameArray.enumerated() {
            print("\(i).  \(game.title)")
        }
        
        removeGameInput = Int(readLine()!)
        
        while removeGameInput! > secretGameArray.count-1 || removeGameInput! < 0 {
            print("Please enter a valid number.")
            removeGameInput = Int(readLine()!)
        }
        
        secretGameArray.remove(at: removeGameInput!)
        print("Game removed.")
    }
    
    
    func listAvailableSecretGames() {
        
        for (i, game) in secretGameArray.enumerated() {
            if game.checkedIn == true {
                print("\(i). \(game.title)")
            }
        }
    }
    
    
    func listUnavailableSecretGames() {
        
        for (i, game) in secretGameArray.enumerated() {
            if game.checkedIn == false {
                print("\(i). \(game.title)")
            }
        }
    }
    
    
    func checkSecretGameOut() {
        
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, YYYY"
        
        print("Please enter the number of the game you would like to check out: ")
        
        for (i, game) in secretGameArray.enumerated() {
            if game.checkedIn == true {
                print("\(i).  \(game.title)")
            }
        }
        
        var checkOutInput = Int(readLine()!)
        
        if  secretGameArray[checkOutInput!].checkedIn == false {
            print("Invalid Input.")
        } else {
            secretGameArray[checkOutInput!].checkedIn = false
            print("This game is due back on \(dateFormatter.string(from: dueDate!))")
        }
        
        while checkOutInput! > (secretGameArray.count - 1) || checkOutInput! < 0 {
            print("Please enter a valid number.")
            checkOutInput = Int(readLine()!)
        }
        
        secretGameArray[checkOutInput!].dueDate = dueDate
    }
    
    func checkSecretGameIn() {
        
        print("Please enter the number of the secret game you would like to check in: ")
        
        for (i, game) in secretGameArray.enumerated() {
            if game.checkedIn == false {
                print("\(i).  \(game.title)")
            }
        }
        
        var checkInInput = Int(readLine()!)
        
        while checkInInput! > secretGameArray.count-1 || checkInInput! < 0 {
            print("Please enter a valid number.")
            checkInInput = Int(readLine()!)
        }
        
        
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())!
        
        if Date() > dueDate {
            print("This secret game is overdue. Please pay your fine.")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, YYYY"
        
        if secretGameArray[checkInInput!].checkedIn == true {
            print("Invalid Input.")
        } else {
            secretGameArray[checkInInput!].checkedIn = true
            print("Thank you for checking this game back in.")
        }
    }
    
}

