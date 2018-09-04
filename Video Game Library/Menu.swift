//
//  Menu.swift
//  Video Game Library
//
//  Created by Kyle Houts on 8/30/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import Foundation

class Menu {
    
    var shouldQuit = false
    
    // Create a new instance of the Library class
    let library = Library()
    
    func go() {
        help()
        
        repeat {
            
            var input = getInput()
            
            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            
            handleInput(input)
            
        } while !shouldQuit
    }
    
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            library.addGame()
            help()
        case "2":
            library.removeGame()
            help()
        case "3":
           library.listAvailableGames()
            help()
        case "4":
            library.listUnavalableGames()
            help()
        case "5":
            print("Check out game")
        case "6":
            print("Check in game")
        case "7":
            help()
        case "8":
            quit()
        default:
            break
        }
    }
    
    
    
    func help() {
        print("""
        Menu
        1. Add game
        2. Remove game
        3. List games available
        4. List checked out games
        5. Check out game
        6. Check in games
        7. Help
        8. Quit

        """)
    }
    
    
    
    func validateInput (_ input: String) -> Bool {
        let menuOptions = Array(1...8)
        
        guard let number = Int(input) else {return false}
        
        return menuOptions.contains(number)
    }
    
    
    
    func quit() {
        shouldQuit = true
        print("Thanks for coming")
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
    
    
}





















