//
//  ViewController.swift
//  UserDefaults
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func save(_ sender: Any) {
        
        noteLabel.text = "Goal: \(noteTextField.text!)"
        dateLabel.text = "Deadlane: \(dateTextField.text!)"
    }
    @IBAction func deleteData(_ sender: Any) {
    }
    
}

