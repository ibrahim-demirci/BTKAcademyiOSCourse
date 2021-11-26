//
//  DetailsViewController.swift
//  NoteAppWithCoreData
//
//  Created by İbrahim Demirci on 26.11.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var sizeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRec)
        
    }
    
    
    
    @objc func closeKeyboard(){
        
        view.endEditing(true)
        
        
    }
    

  
}
