//
//  ViewController.swift
//  AlertControllers
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClick(_ sender: Any) {
        
        let alertMessage = UIAlertController(title: "Fail", message: "Email wrong", preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
            // When clicked
            print("Ok Clicked")
        }
        
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true, completion: nil)
    }
    
}

