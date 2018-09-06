//
//  Menu.swift
//  VideoGameLibraryTest
//
//  Created by Kyle Houts on 9/5/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//


import Foundation


class Menu {
    
    var shouldQuit = false
    var cheating = false
    
    // Create a new instance of the Library class
    let library = Library()
    let secretLibrary = SecretLibrary()
    
    
    func go() {
        help()
        
        repeat {
            
            var input = getInput()
            
            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            
            if cheating {
                handleSecretInput(input)
            } else {
                handleInput(input)
            }
            
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
            library.listUnavailableGames()
            help()
        case "5":
            library.checkGameOut()
            help()
        case "6":
            library.checkGameIn()
            help()
        case "7":
            help()
        case "8":
            quit()
        case "0":
            cheating = true
            secretHelp()
        default:
            break
        }
    }
    
    
    
    func help() {
        print("""
        Main Menu
        1. Add game
        2. Remove game
        3. List games available
        4. List checked out games
        5. Check out game
        6. Check in games
        7. Menu
        8. Quit

        """)
    }
    
    
    
    func validateInput (_ input: String) -> Bool {
        let menuOptions = Array(0...8)
        
        guard let number = Int(input) else {return false}
        
        return menuOptions.contains(number)
    }
    
    
    
    func quit() {
        shouldQuit = true
        print("Thanks for coming")
    }
    
    func secretHelp() {
        print("""
        Welcome to the secret menu!
        1. Add secret game
        2. Remove secret game
        3. List secret games available
        4. List secret checked out games
        5. Check out secret game
        6. Check in secret games
        7. Main Menu
        8. Quit
        """)
    }
    
    func handleSecretInput(_ input: String) {
        switch input {
        case "1":
            secretLibrary.addSecretGame()
            secretHelp()
        case "2":
            secretLibrary.removeSecretGame()
            secretHelp()
        case "3":
            secretLibrary.listAvailableSecretGames()
            secretHelp()
        case "4":
            secretLibrary.listUnavailableSecretGames()
            secretHelp()
        case "5":
            secretLibrary.checkSecretGameOut()
            secretHelp()
        case "6":
            secretLibrary.checkSecretGameIn()
            secretHelp()
        case "7":
            cheating = false
            help()
        case "8":
            quit()
        default:
            break
        }
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
