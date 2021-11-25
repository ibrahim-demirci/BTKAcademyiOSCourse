//
//  ViewController.swift
//  LayoutProject
//
//  Created by İbrahim Demirci on 24.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        let myLabel = UILabel()
        myLabel.text = "Manuel Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.1, y: height * 0.5 - 50, width: width * 0.8, height: 100)
        view.addSubview(myLabel)
        
        
    }
    


}

