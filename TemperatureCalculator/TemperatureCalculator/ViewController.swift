//
//  ViewController.swift
//  TemperatureCalculator
//
//  Created by user210282 on 11/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    var temperatureWord = "Celsius"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
        
        self.resignFirstResponder()
        
        switch segControl.selectedSegmentIndex {
        case 0:
            let fahrenheit = Double(textField.text!)
            let celsius = (fahrenheit! - 32) / 1.8
            outputLabel.text = "\(String(format:"%4.2f",celsius)) Celsius"
            
            if 	celsius > 120 {
                imageView.image =  UIImage(named: "Temp9")
            } else if celsius > 100 {
                imageView.image = UIImage(named: "Temp8")
            } else if celsius > 80 {
                imageView.image = UIImage(named: "Temp7")
            } else if celsius > 60 {
                imageView.image = UIImage(named: "Temp6")
            } else if celsius > 40 {
                imageView.image = UIImage(named: "Temp5")
            } else if celsius > 20 {
                imageView.image = UIImage(named: "Temp4")
            } else if celsius > 0 {
                imageView.image = UIImage(named: "Temp3")
            } else if celsius > -20 {
                imageView.image = UIImage(named: "Temp2")
            } else if celsius < -20 {
                imageView.image = UIImage(named: "Temp1")
            }
            
            
            
        case 1:
            let celsius = Double(textField.text!)
            let fahrenheit = celsius! * 1.8 + 32
        
            outputLabel.text = "\(String(format:"%4.2f",fahrenheit)) Fahrenheit"
            
            if     fahrenheit > 160 {
                imageView.image =  UIImage(named: "Temp9")
            } else if fahrenheit > 140 {
                imageView.image = UIImage(named: "Temp8")
            } else if fahrenheit > 120 {
                imageView.image = UIImage(named: "Temp7")
            } else if fahrenheit > 100 {
                imageView.image = UIImage(named: "Temp6")
            } else if fahrenheit > 80 {
                imageView.image = UIImage(named: "Temp5")
            } else if fahrenheit > 60 {
                imageView.image = UIImage(named: "Temp4")
            } else if fahrenheit > 40 {
                imageView.image = UIImage(named: "Temp3")
            } else if fahrenheit > 20 {
                imageView.image = UIImage(named: "Temp2")
            } else if fahrenheit < 20 {
                imageView.image = UIImage(named: "Temp1")
            }
            
        default:
            enterLabel.text = "NULL"
            temperatureWord = "NULL"
            textField.text = ""
            
        }
    }
    
    @IBAction func formula(_ sender: Any) {
        
        switch		 segControl.selectedSegmentIndex {
        case 0:
            enterLabel.text = "Enter Fahrenheit"
            outputLabel.text = "0 Celsius"
            textField.text = ""
            
        case 1:
            enterLabel.text = "Enter Celsius"
            outputLabel.text = "0 Fahrenheit"
            textField.text = ""
            
        default:
            enterLabel.text = "NULL"
            outputLabel.text = "NULL"
            textField.text = ""
            
        }
    }
    
}

