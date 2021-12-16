//
//  ViewController.swift
//  FactBrain
//
//  Created by user210282 on 11/29/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func factBrain(_ sender: Any) {
        let array = [   """
                        Down To Earth
                        Meaning: Practical or humble; unpretentious.
                        """,
                        """
                        Mountain Out of a Molehill
                        Meaning: One who escalates small things and turns them into big problems.
                        """,
                        """
                        What Goes Up Must Come Down
                        Meaning: Things that go up must eventually return to the earth due to gravity.
                        """,
                        """
                        My Cup of Tea
                        Meaning: Someone or something that one finds to be agreeable or delightful.
                        """,
                        """
                        Needle In a Haystack
                        Meaning: Something that is impossible or extremely difficult to find, especially because the area you have to search is too large.
                        """]
        label.text = array.randomElement()
        
    }
    
}

