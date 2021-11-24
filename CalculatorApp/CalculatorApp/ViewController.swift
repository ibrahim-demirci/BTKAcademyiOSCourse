//
//  ViewController.swift
//  CalculatorApp
//
//  Created by İbrahim Demirci on 24.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var result = 0
    
    
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
         
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addition(_ sender: Any) {
        
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                result = firstNum + secondNum
                resultLabel.text = String(result)
                
            }else{
                resultLabel.text = "Second field is not num!"
            }
            
        }else{
            resultLabel.text = "First field is not num! "
        }
    }
    
    @IBAction func subtraction(_ sender: Any) {
        
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                result = firstNum - secondNum

                resultLabel.text = String(result)

            }else{
                resultLabel.text = "Second field is not num!"

            }
        }else{
            resultLabel.text = "First field is not num! "
        }

    }
    
    @IBAction func division(_ sender: Any) {
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                
                result = firstNum / secondNum
                resultLabel.text = String(result)

            }else{
                resultLabel.text = "Second field is not num!"

            }
        }else{
            resultLabel.text = "First field is not num! "

        }
    }
    
    @IBAction func multiplication(_ sender: Any) {
        
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                
                result = firstNum * secondNum
                resultLabel.text = String(result)

            }else{
                
                resultLabel.text = "Second field is not num!"
            }
        }else{
            
            resultLabel.text = "First field is not num! "
        }
    }
}

