//
//  ViewController.swift
//  TapMeFast
//
//  Created by user210282 on 11/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    var restartTimer = Timer()
    var timer = Timer()
    var timerInt = 10
    var scoreInt = 0
    var gameInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerInt = 10
        
        
    }

    @IBAction func tap(_ sender: Any) {
        
        if timerInt == 10 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            buttonLabel.isEnabled = false
            buttonLabel.alpha = 0.5
            
            scoreInt = 0
            scoreLabel.text = String(scoreInt)
        }
        if gameInt == 1 {
            scoreInt += 1
            scoreLabel.text = String(scoreInt)
        }
        
    }
    
    @objc func updateTimer(){
        timerInt -= 1
        timeLabel.text = String(timerInt)
        
        buttonLabel.isEnabled = true
        buttonLabel.alpha = 1.0
        
        gameInt = 1
       
        buttonLabel.setTitle("Tap", for: UIControl.State.normal)
       
        if timerInt == 0 {
            timer.invalidate()
            
            gameInt = 0
            
            buttonLabel.isEnabled = false
            buttonLabel.alpha = 0.5
            
            restartTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
            
        }
    }
    
    @objc func restart(){
        
        buttonLabel.isEnabled = true
        buttonLabel.alpha = 1.0
        
        buttonLabel.setTitle("Restart", for: UIControl.State.normal)
        timerInt = 10
        
    }
    
}

