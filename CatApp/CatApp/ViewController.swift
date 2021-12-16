//
//  ViewController.swift
//  CatApp
//
//  Created by user210282 on 11/24/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    var catSound: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.imageView?.contentMode = .scaleAspectFit
        label.isHidden = true
        
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        
        catch{
            print(error)
        }
        
    }

    @IBAction func btn_cat(_ sender: Any) {
        label.isHidden = false
        
        catSound.play()
        
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func hideLabel(){
        label.isHidden = true
    }
    
}

