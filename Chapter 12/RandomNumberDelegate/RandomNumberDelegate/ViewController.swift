//
//  ViewController.swift
//  RandomNumberDelegate
//
//  Created by Stefan Kaczmarek on 3/9/19.
//  Copyright © 2019 The Zonie, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GuessDelegate {
    var previousGuess = ""
    var randomNumber = 0

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        createRandomNumber()
        playAgainButton.isHidden = true
        resultLabel.text = ""
    }

    // event triggered by playAgainButton
    @IBAction func playAgain(_ sender: Any) {
        createRandomNumber()
        // only show the button when the user guessed the right #
        playAgainButton.isHidden = true
        // show the button
        guessButton.isHidden = false
        resultLabel.text = ""
        userGuessLabel.text = "New Game"
        previousGuess = ""
    }

    // function called from the GuessInputViewController when the user
    // taps on the Save Button button
    func userDidFinish(_ controller: GuessInputViewController, guess:  String) {
        userGuessLabel.text = "The guess was " +  guess
        previousGuess = guess
        if let numberGuess = Int(guess) {
            if (numberGuess > randomNumber) {
                resultLabel.text = "Guess too high"
            } else if (numberGuess < randomNumber) {
                resultLabel.text = "Guess too low"
            } else {
                resultLabel.text = "Guess is correct"
                //show the play again button
                playAgainButton.isHidden = false
                //hide the guess again number
                guessButton.isHidden = true
            }
        }

        // pops the GuessInputViewController off the stack
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

    // creates the random number
    func createRandomNumber() {
        // get a random number between 0-100
        randomNumber = Int(arc4random_uniform(100))
        // lets us cheat :)
        print("The random number is: \(randomNumber)")
        return
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "MyGuessSegue" {
            let vc = segue.destination as! GuessInputViewController
            // passes the previousGuess property to the GuessInputViewController
            vc.previousGuess = previousGuess
            vc.delegate = self
        }
    }
}
