//
//  ViewController.swift
//  Timer
//
//  Created by user210282 on 11/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = String(counter)
    }

    @IBAction func startTimer(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer (){
        
        counter += 1
        label.text = String(counter)
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        counter = 0
        label.text = String(counter)
    }
    
}

