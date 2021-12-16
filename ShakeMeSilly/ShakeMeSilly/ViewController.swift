//
//  ViewController.swift
//  ShakeMeSilly
//
//  Created by user210282 on 11/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var time = Timer()
    
    var timeInt = 10
    var scoreInt = 0
    
    var imageInt = 1
    var mode = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
   
    @IBAction func startStop(_ sender: Any) {
        
        mode = 1
        button.isEnabled = false
        
        scoreInt = 0
        score.text = String(scoreInt)
        
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        
        timeInt -= 1
        timer.text = String(timeInt)
        
        if timeInt <= 0 {
            mode = 0
            time.invalidate()
            Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(restart), userInfo: nil, repeats: false)

        }
    }
    
    @objc func restart(){
        button.isEnabled = true
        timeInt = 10
        timer.text = String(timeInt)
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
           
            if mode == 1 {
                scoreInt += 1
                score.text = String(scoreInt)
                
                imageView.image = UIImage(named: "Face\(imageInt)")
                
                if imageInt == 12 {
                    imageInt = 1
                }
                
                imageInt += 1
            }
        }
    }
    
}

