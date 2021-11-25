//
//  ViewController.swift
//  ViewControllerProject
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func controlClicked(_ sender: Any) {
        password = textField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC"{
                
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.gettedPass = password
            
        }
        
    }
    
}

