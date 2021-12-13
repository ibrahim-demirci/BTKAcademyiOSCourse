//
//  ViewController.swift
//  PhotoShareAppParse
//
//  Created by İbrahim Demirci on 13.12.2021.
//

import UIKit
import Parse


class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameField.text != "" && passwordField.text != ""{
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { user, error in
                
                if error != nil {
                    self.showAlert(title: "Error", message: error?.localizedDescription ?? "Error when sign in")
                } else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
            
        }else {
            showAlert(title: "Empty", message: "Cant be empty username or password")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameField.text != "" && passwordField.text != ""{
            let user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
            
            user.signUpInBackground { isSuccess, error in
                
                if error != nil{
                    self.showAlert(title: "Error", message: error?.localizedDescription ?? "Error when signUp")
                } else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        } else {
            showAlert(title: "Empty", message: "Cant be empty username or password")
        }
        
    }
    
    func showAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}

