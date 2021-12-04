//
//  SettingsViewController.swift
//  PhotoShareAppFirebase
//
//  Created by İbrahim Demirci on 3.12.2021.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func logOut(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
        } catch {
            print("error when log out")
        }
        
    }
    
}
