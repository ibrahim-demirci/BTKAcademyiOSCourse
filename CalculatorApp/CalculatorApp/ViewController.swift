//
//  ViewController.swift
//  CalculatorApp
//
//  Created by İbrahim Demirci on 24.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addition(_ sender: Any) {
        let first = Int(firstText.text!)!
        let second = Int(secondText.text!)!
        
        let res = first + second
        resultLabel.text = String(res)

    }
    
    @IBAction func subtraction(_ sender: Any) {
    
    }
    
    @IBAction func division(_ sender: Any) {
    
    }
    
    @IBAction func multiplication(_ sender: Any) {
    
    }
}

