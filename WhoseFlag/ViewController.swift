//
//  ViewController.swift
//  WhoseFlag
//
//  Created by Catherine on 2/21/19.
//  Copyright © 2019 Catherine Priazhnikova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var amountOfQuestions = 0
    var sharedEnabled = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        // Do any additional setup after loading the view, typically from a nib.
        button1.layer.borderColor = UIColor.darkGray.cgColor
        button2.layer.borderColor = UIColor.darkGray.cgColor
        button3.layer.borderColor = UIColor.darkGray.cgColor
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        if amountOfQuestions == 10 {
            
            showAlert(title: "Final score", message: "Your score is \(score)")
            score = 0
            amountOfQuestions = 0
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " Your score: \(score)"
        
        amountOfQuestions += 1

    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Your score is \(score)"
        } else {
            title = "Wrong"
            message = "That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        showAlert(title: title, message: message)
        
    }
    
    func showAlert (title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }

    
}

