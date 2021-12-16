//
//  ViewController.swift
//  RollDice
//
//  Created by user210282 on 11/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func randomDice(_ sendr: Any) {
        
        let randomNumber = Int.random(in: 1...6)
        
        label.text = String("Rolled a \(randomNumber)")
        
        switch randomNumber{
            case 1:
                imageView.image = UIImage(named: "Dice1")
            case 2:
                imageView.image = UIImage(named: "Dice2")
            case 3:
                imageView.image = UIImage(named: "Dice3")
            case 4:
                imageView.image = UIImage(named: "Dice4")
            case 5:
                imageView.image = UIImage(named: "Dice5")
            case 6:
                imageView.image = UIImage(named: "Dice6")
            default:
                imageView.image = UIImage(named: "Dice1")
        }
        
    }
    
}

