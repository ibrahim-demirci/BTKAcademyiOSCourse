//
//  ViewController.swift
//  PhotoShareAppFirebase
//
//  Created by İbrahim Demirci on 3.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: Any) {
    }
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    

}

