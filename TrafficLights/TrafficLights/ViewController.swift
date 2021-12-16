//
//  ViewController.swift
//  TrafficLights
//
//  Created by user210282 on 11/26/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var trafficLightImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var StartStopButton: UIButton!
    
    var startTimer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scoreInt = 0
        
        StartStopButton.titleLabel?.adjustsFontSizeToFitWidth = false
    }

    @IBAction func startGame(_ sender: Any) {
        
        if scoreInt == 0 {
            
            timerInt = 3
            
            trafficLightImage.image = UIImage(named: "trafficLight")
            
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            StartStopButton.isEnabled = false
            StartStopButton.setTitle("", for: UIControl.State.normal)
            label.text = String(scoreInt)
            
        } else {
            
            scoreTimer.invalidate()
            
            scoreInt = 0
            
            StartStopButton.setTitle("Restart", for: UIControl.State.normal)
            
        }
        
    }
    
    @objc func updateTimer(){
        
        timerInt -= 1
        
        if timerInt == 2 {
            trafficLightImage.image = UIImage(named: "trafficLight3")
        } else if timerInt == 1 {
            trafficLightImage.image = UIImage(named: "trafficLight2")
        } else if timerInt == 0 {
            trafficLightImage.image = UIImage(named: "trafficLight1")
            
            startTimer.invalidate()
            
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            
            StartStopButton.isEnabled = true
            StartStopButton.setTitle("Stop", for: UIControl.State.normal)
        }
        
    }
    
    @objc func updateScoreTimer() {
        scoreInt += 1
        label.text = String(scoreInt)
        
    }
}

