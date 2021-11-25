//
//  ViewController.swift
//  GestureRecognizers
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var ankara = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageChange))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func imageChange(){
        
        if ankara {
            
            imageView.image = UIImage(named: "ankara")
            ankara = false
        }else {
            imageView.image = UIImage(named: "istanbul")
            ankara = true
        }
        print("Clicked")
        
    }


}

