//
//  ViewController.swift
//  DigitalClock
//
//  Created by user210282 on 11/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet var mainView: UIView!
    
  
    @IBOutlet weak var clockColor: UISegmentedControl!
    @IBOutlet weak var clockBackground: UISegmentedControl!
    @IBOutlet weak var clockImage: UISegmentedControl!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        self.updateTime()
        
        settingsView.isHidden = true
        
        settingsView.layer.cornerRadius = 5
    }
    
    @objc func updateTime(){
        let timerFortmatter = DateFormatter()
        timerFortmatter.dateFormat = "hh:mm:ss"
        
        time.text = timerFortmatter.string(from: NSDate() as Date)
    }
    
    @IBAction func showSettings(_ sender: Any) {
        
        if settingsView.isHidden == true {
            settingsView.isHidden = false
            settingsButton.setTitle("Hide Settings", for: UIControl.State.normal)
            settingsButton.alpha = 1.0
            
        } else {
            settingsView.isHidden = true
            settingsButton.setTitle("Show Settings", for: UIControl.State.normal)
            settingsButton.alpha = 0.25
            
        }
        
    }
    
    @IBAction func clockColor(_ sender: UISegmentedControl) {
        
        switch self.clockColor.selectedSegmentIndex {
            case 0:
                self.time.textColor = UIColor.white
            case 1:
                self.time.textColor = UIColor.black
            case 2:
                self.time.textColor = UIColor.red
            case 3:
                self.time.textColor = UIColor.green
            default:
                self.time.textColor = UIColor.white
        }
    }
    @IBAction func clockBackground(_ sender: UISegmentedControl) {
        
        backgroundImage.isHidden = true
        
        switch self.clockBackground.selectedSegmentIndex {
            case 0:
            self.mainView.backgroundColor = UIColor.black
            case 1:
                self.mainView.backgroundColor = UIColor.white
            case 2:
                self.mainView.backgroundColor = UIColor.yellow
            case 3:
                self.mainView.backgroundColor = UIColor.blue
            default:
                self.mainView.backgroundColor = UIColor.black
        }
    }
    @IBAction func clockImage(_ sender: UISegmentedControl) {
        
        backgroundImage.isHidden = false
        
        switch self.clockImage.selectedSegmentIndex {
            case 0:
                self.backgroundImage.image = UIImage(named: "Background1")
            case 1:
                self.backgroundImage.image = UIImage(named: "Background2")
            case 2:
                self.backgroundImage.image = UIImage(named: "Background3")
            case 3:
                self.backgroundImage.image = UIImage(named: "Background4")
            default:
                self.backgroundImage.image = UIImage(named: "")
        }
    }
    
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
    }
    
    
    
    
}

