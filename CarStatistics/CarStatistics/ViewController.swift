//
//  ViewController.swift
//  CarStatistics
//
//  Created by user210282 on 11/29/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    var items = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.items = loadPlist()
        randomCar("")
    }
    
    func loadPlist() -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "carList", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
        
    }

    @IBAction func randomCar(_ sender: Any) {
        
        let dataSelected = items.randomElement()!
        
        imageView.image = UIImage(named: dataSelected["Image"]!)
        label1.text = dataSelected["Name"]
        label2.text = "Top Speed: \(dataSelected["Top Speed"]!) MHP"
        label3.text = "0-60: \(dataSelected["0-60"]!) seconds"
        label4.text = "BHP: \(dataSelected["BHP"]!)"
        label5.text = "MGP: \(dataSelected["MGP"]!)"
        label6.text = "Price: \(dataSelected["Price"]!)"
        
    }
    
}

