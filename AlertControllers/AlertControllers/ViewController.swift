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
           alertMessage(title: "Fail", message: "Email empty.")
        
        }else if passwordField.text == ""{
            //Password empty
            alertMessage(title: "Fail", message: "Password empty.")
        
        }else if confirmPasswordField.text == "" || passwordField.text != confirmPasswordField.text{
            
            alertMessage(title: "Fail", message: "Passwords not matching.")
            
        }else {
        
            alertMessage(title: "Success", message: "User created.")
            
        }
        
        
    }
    
    func alertMessage(title:String,message:String){
        
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
            // When clicked
            print("Ok Clicked")
        }
        
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true, completion: nil)
        
    }
    
}

