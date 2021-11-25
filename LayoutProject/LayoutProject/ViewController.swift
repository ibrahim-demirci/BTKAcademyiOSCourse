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
        
        
        //Label
        let myLabel = UILabel()
        myLabel.text = "Manuel Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.1, y: height * 0.5 - 50, width: width * 0.8, height: 300)
        view.addSubview(myLabel)
        
        
        //Button
        let myButton = UIButton()
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width * 0.5 - 100, y: height * 0.65, width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.buttonFunc), for: UIControl.Event.touchUpInside)
    }
    
    
    @IBAction func buttonFunc(){
        
        print("Button Clicked")
    }
    


}

