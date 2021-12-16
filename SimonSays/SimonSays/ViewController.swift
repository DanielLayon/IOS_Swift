//
//  ViewController.swift
//  SimonSays
//
//  Created by user210282 on 12/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var timer = Timer()
    var simonTimer = Timer()
    
    var timeInt = 20
    var scoreInt = 0
    var modeInt = 0
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender: )))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender: )))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender: )))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender: )))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    

    @IBAction func startGame(_ sender: Any) {
        
        timeInt = 20
        timeLabel.text = "Time: \(String(timeInt))"
        scoreInt = 0
        scoreLabel.text = "Score: \(String(scoreInt))"
        modeInt = 1
        button.isEnabled = false
        
        self.simonSays()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime(){
        
        
        timeInt -= 1
        timeLabel.text = "Time: \(String(timeInt))"
        
        if timeInt <= 0 {
            
            modeInt = 0
            swipeLabel.text = "Game Over"
            timer.invalidate()
            simonTimer.invalidate()
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc func restart(){
        button.isEnabled = true
    }
    
    @objc func simonSays(){
        
        let array = [
                    "Simon Says Swipe Right",
                    "Simon Says Swipe Left",
                    "Simon Says Swipe Up",
                    "Simon Says Swipe Down",
                    "Swipe Right",
                    "Swipe Left",
                    "Swipe Up",
                    "Swipe Down"]
        
        let randomWord = array.randomElement()
        swipeLabel.text = randomWord
        
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(simonSays), userInfo: nil, repeats: false)
    }
    
    @objc func swipeGestures(sender: UISwipeGestureRecognizer){
        
        if modeInt == 1{
            if sender.direction == UISwipeGestureRecognizer.Direction.right {
                
                simonTimer.invalidate()
                
                if swipeLabel.text == "Simon Says Swipe Right" || swipeLabel.text == "Swipe Right" {
                    
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                } else {
                    
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                    
                }
                
            }
            else if sender.direction == UISwipeGestureRecognizer.Direction.left {
                
                simonTimer.invalidate()
                
                if swipeLabel.text == "Simon Says Swipe Left" || swipeLabel.text == "Swipe Left" {
                    
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                } else {
                    
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                    
                }
                
                
            }
            else if sender.direction == UISwipeGestureRecognizer.Direction.up {
                
                simonTimer.invalidate()
                
                if swipeLabel.text == "Simon Says Swipe Up" || swipeLabel.text == "Swipe Up" {
                    
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                } else {
                    
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                    
                }
                
                
            }
            else if sender.direction == UISwipeGestureRecognizer.Direction.down {
                
                simonTimer.invalidate()
                
                if swipeLabel.text == "Simon Says Swipe Down" || swipeLabel.text == "Swipe Down" {
                    
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                } else {
                    
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.simonSays()
                    
                }
  
            }
        }
        
        
        
    }
    
}

