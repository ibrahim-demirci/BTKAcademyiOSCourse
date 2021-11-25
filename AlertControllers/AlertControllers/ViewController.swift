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
        
        
        if emailField.text == ""{
            //Email empty
            let alertMessage = UIAlertController(title: "Fail", message: "Email wrong", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // When clicked
                print("Ok Clicked")
            }
            
            alertMessage.addAction(okButton)
            self.present(alertMessage, animated: true, completion: nil)
        
        }else if passwordField.text == ""{
            //Password empty
            let alertMessage = UIAlertController(title: "Fail", message: "Password wrong", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // When clicked
                print("Ok Clicked")
            }
            
            alertMessage.addAction(okButton)
            self.present(alertMessage, animated: true, completion: nil)
        
        }else if confirmPasswordField.text == "" || passwordField.text != confirmPasswordField.text{
            
            let alertMessage = UIAlertController(title: "Fail", message: "Passwords not matching", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // When clicked
                print("Ok Clicked")
            }
            
            alertMessage.addAction(okButton)
            self.present(alertMessage, animated: true, completion: nil)
            
        }else {
            
            let alertMessage = UIAlertController(title: "Success", message: "Congratulations", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // When clicked
                print("Ok Clicked")
            }
            
            alertMessage.addAction(okButton)
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        
    }
    
}

