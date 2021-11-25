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
        
        let note = UserDefaults.standard.object(forKey: "note")
        let date = UserDefaults.standard.object(forKey: "date")
        if let noteData  = note as? String{
            noteLabel.text = "Goal: \(noteData)"
        }
        if let dateData = date as? String{
            dateLabel.text = "Deadline: \(dateData)"
        }
    }


    @IBAction func save(_ sender: Any) {
        
        UserDefaults.standard.set(noteTextField.text!, forKey: "note")
        UserDefaults.standard.set(dateTextField.text!, forKey: "date")
        noteLabel.text = "Goal: \(noteTextField.text!)"
        dateLabel.text = "Deadlane: \(dateTextField.text!)"
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        
        let note = UserDefaults.standard.object(forKey: "note")
        let date = UserDefaults.standard.object(forKey: "date")
            
        if (note as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "note")
        }
        if( date as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "date")

        }
        
    }
    
}

