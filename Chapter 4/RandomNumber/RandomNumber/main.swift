//
//  main.swift
//  RandomNumber
//

import Foundation

var randomNumber = 1
var continueGuessing = true
var keepPlaying = true
var input = ""

while keepPlaying {
    // get a random number between 0 - 100
    randomNumber = Int(arc4random_uniform(101))
    print("The random number to guess is: \(randomNumber)")

    while continueGuessing {
        print("Pick a number between 0 and 100.")
        // get keyboard input, and trim the new line
        input = String(bytes: FileHandle.standardInput.availableData, encoding: .utf8)!
        input = input.trimmingCharacters(in: .whitespacesAndNewlines)

        if let userGuess = Int(input) {
            if userGuess == randomNumber {
                continueGuessing = false
                print("Correct number!")
            } else if userGuess > randomNumber {
                // user guessed too high
                print("Your guess is too high!")
            } else{
                // no reason to check if userGuess < randomNumber. It has to be.
                print("Your guess is too low!")
            }
        } else {
            print("Invalid guess, please try again.")
        }
    }

    print ("Play Again? Y or N")
    input = String(bytes: FileHandle.standardInput.availableData, encoding: .utf8)!
    input = input.trimmingCharacters(in: .whitespacesAndNewlines)

    if input == "N" || input == "n" {
        keepPlaying = false
    }

    continueGuessing = true
}




