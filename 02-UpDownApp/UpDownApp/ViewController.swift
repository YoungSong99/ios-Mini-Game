//
//  ViewController.swift
//  UpDownApp
//
//  Created by Young Song on 4/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleBackground: UIView!

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var numTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!

    @IBOutlet var numButtons: [UIButton]!

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var retryButton: UIButton!

    var comNumber = Int.random(in: 1...10)
    var myNumber: Int = 1
    var numOfTry: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        subTitle.text = "Guess my number in 3 tries!"
        mainTitle.text = "UP & DOWN Game"
        numTitle.text = "?"

        // titleBackground coner and shadow
        titleBackground.layer.cornerRadius = 40
        titleBackground.clipsToBounds = false

        titleBackground.layer.shadowColor = #colorLiteral(red: 0.1550198495, green: 0.03996146098, blue: 0.5112366676, alpha: 1)
        titleBackground.layer.shadowOpacity = 0.4
        titleBackground.layer.shadowOffset = CGSize(width: 0, height: 16)
        titleBackground.layer.shadowRadius = 32
        titleBackground.layer.masksToBounds = false


        // numButton shadow
        for (_, button) in numButtons.enumerated(){
            button.layer.shadowColor = #colorLiteral(red: 0.1550198495, green: 0.03996146098, blue: 0.5112366676, alpha: 1)
            button.layer.shadowOpacity = 0.4
            button.layer.shadowOffset = CGSize(width: 0, height: 16)
            button.layer.shadowRadius = 32
            button.layer.masksToBounds = false
        }

        // submit, resetbutton
        submitButton.layer.cornerRadius = 12
        submitButton.layer.borderWidth = 1.0
        submitButton.layer.borderColor = UIColor.white.cgColor
        submitButton.clipsToBounds = false

        submitButton.layer.shadowColor = #colorLiteral(red: 0.1550198495, green: 0.03996146098, blue: 0.5112366676, alpha: 1)
        titleBackground.layer.shadowOpacity = 0.4
        titleBackground.layer.shadowOffset = CGSize(width: 0, height: 16)
        titleBackground.layer.shadowRadius = 32
        titleBackground.layer.masksToBounds = false
        // resetbutton
        retryButton.layer.cornerRadius = 12
        retryButton.layer.borderWidth = 1.0
        retryButton.layer.borderColor = UIColor.white.cgColor
        retryButton.clipsToBounds = false

        retryButton.layer.shadowColor = #colorLiteral(red: 0.1550198495, green: 0.03996146098, blue: 0.5112366676, alpha: 1)
        retryButton.layer.shadowOpacity = 0.4
        retryButton.layer.shadowOffset = CGSize(width: 0, height: 16)
        retryButton.layer.shadowRadius = 32
        retryButton.layer.masksToBounds = false
    }


    @IBAction func numButtonTapped(_ sender: UIButton) {
        guard let numString = sender.currentTitle else {return}

        numTitle.text = numString

        guard let num = Int(numString) else { return }
        myNumber = num
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        numOfTry += 1
        let remainingTries = 3 - numOfTry

        if remainingTries >= 0 {
            if comNumber > myNumber {
                mainTitle.text = "That's too small 😏"
                subTitle.text = (remainingTries > 1) ? "Guess my number in \(remainingTries) tries!" : "This is your last try. Be careful!"
            } else if comNumber < myNumber {
                mainTitle.text = "That's too big! 😲"
                subTitle.text = (remainingTries > 1) ? "Guess my number in \(remainingTries) tries!" : "This is your last try. Be careful!"
            } else {
                mainTitle.text = "You got it! 🥳"
                subTitle.text = "Congratulations!"
                submitButton.isEnabled = false
                return
            }
        }

        if remainingTries == 0 {
            subTitle.text = "No more tries left!"
            mainTitle.text = "Game Over! 😈"
            numTitle.text = "The answer was \(comNumber)"
            submitButton.isEnabled = false
        }
    }


    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comNumber = Int.random(in: 1...10)
        numOfTry = 0
        subTitle.text = "Guess my number in 3 tries!"
        mainTitle.text = "UP & DOWN Game"
        numTitle.text = "?"
        submitButton.isEnabled = true
    }

}

