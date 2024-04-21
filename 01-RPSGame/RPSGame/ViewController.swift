//
//  ViewController.swift
//  RPSGame
//
//  Created by Young Song on 4/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLable: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    

    @IBOutlet weak var comChoiceLable: UILabel!
    @IBOutlet weak var myChoiceLable: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var throwingButton: UIButton!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    var myChoice:Rps = Rps.rock
    var comChoice:Rps = Rps(rawValue: Int.random(in:0...2))!
    
    var lastSelectedButton: UIButton?

    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        startAnimation()
        comChoiceLable.text = "READY"
        myChoiceLable.text = "READY"
        
        resetButton.layer.borderWidth = 1.0
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.cornerRadius = 20.0
        
        throwingButton.layer.cornerRadius = 20.0
        
        
    }
    
    
    func startAnimation() {
        let comImages = [
            UIImage(named: "Property 1=P1, Property 2=rock")!,
            UIImage(named: "Property 1=P1, Property 2=paper")!,
            UIImage(named: "Property 1=P1, Property 2=scissors")!
        ]
        
        let myImages = [
            UIImage(named: "Property 1=P2, Property 2=rock")!,
            UIImage(named: "Property 1=P2, Property 2=paper")!,
            UIImage(named: "Property 1=P2, Property 2=scissors")!
        ]
        
        comImageView.animationImages = comImages
        myImageView.animationImages = myImages
        
        comImageView.animationDuration = 2.0
        comImageView.animationRepeatCount = 0
        myImageView.animationDuration = 2.0
        myImageView.animationRepeatCount = 0
        
        comImageView.startAnimating()
        myImageView.startAnimating()
    }

    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
                
        let title = sender.currentTitle!
        
        if let lastButton = lastSelectedButton {
            resetButtonColor(button: lastButton)
        }
        
        switch title {
        case "ROCK":
            myChoice = Rps.rock
            setButtonSelectedColor(button: sender)
        case "SCISSORS":
            myChoice = Rps.scissors
            setButtonSelectedColor(button: sender)
        case "PAPER":
            myChoice = Rps.paper
            setButtonSelectedColor(button: sender)
        default:
            break
        }
        
        lastSelectedButton = sender
        
    }
    
    
    func setButtonSelectedColor(button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.3429115117, green: 0.3329983056, blue: 0.3331771791, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    func resetButtonColor(button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.9043522477, green: 0.8905171156, blue: 0.8835826516, alpha: 1)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        comImageView.stopAnimating()
        myImageView.stopAnimating()

        switch comChoice {
        case .rock:
            comImageView.image = UIImage(named: "Property 1=P1, Property 2=rock.png")
            comChoiceLable.text = "ROCK"
        case .scissors:
            comImageView.image = UIImage(named: "Property 1=P1, Property 2=scissors.png")
            comChoiceLable.text = "SCISSORS"
        case .paper:
            comImageView.image = UIImage(named: "Property 1=P1, Property 2=paper.png")
            comChoiceLable.text = "PAPER"
        }

        switch myChoice {
        case .rock:
            myImageView.image = UIImage(named: "Property 1=P2, Property 2=rock.png")
            myChoiceLable.text = "ROCK"
        case .scissors:
            myImageView.image = UIImage(named: "Property 1=P2, Property 2=scissors.png")
            myChoiceLable.text = "SCISSORS"
        case .paper:
            myImageView.image = UIImage(named: "Property 1=P2, Property 2=paper.png")
            myChoiceLable.text = "PAPER"
        }
        
        if comChoice == myChoice {
            mainLable.text = "Twinsies! It's a tie."
        } else if comChoice == .rock && myChoice == .paper {
            mainLable.text = "I let you win."
        } else if comChoice == .paper && myChoice == .scissors {
            mainLable.text = "I let you win."
        } else if comChoice == .scissors && myChoice == .rock {
            mainLable.text = "I let you win."
        } else {
            mainLable.text = "Victory is mine!"
        }
        
        sender.backgroundColor = #colorLiteral(red: 0.9660720229, green: 0.9490135312, blue: 0.9353198409, alpha: 1)
        sender.tintColor = UIColor.black
        sender.layer.borderWidth = 1.0
        sender.layer.borderColor = UIColor.black.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = UIColor.black
            sender.tintColor = UIColor.white
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {

        startAnimation()

        comChoiceLable.text = "READY"
        myChoiceLable.text = "READY"
        
        mainLable.text = "ROCK, SCISSOR, PAPER"
        comChoice = Rps(rawValue: Int.random(in:0...2))!
        
        if let lastButton = lastSelectedButton {
            resetButtonColor(button: lastButton)
        }
        
        sender.tintColor = UIColor.white
        sender.backgroundColor = UIColor.black
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = #colorLiteral(red: 0.9660720229, green: 0.9490135312, blue: 0.9353198409, alpha: 1)
            sender.tintColor = UIColor.black
        }
    }
}


