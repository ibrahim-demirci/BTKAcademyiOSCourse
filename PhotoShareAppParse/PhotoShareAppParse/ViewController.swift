//
//  ViewController.swift
//  PhotoShareAppParse
//
//  Created by İbrahim Demirci on 13.12.2021.
//

import UIKit
import Parse


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let parseObject = PFObject(className: "Fruit")
        parseObject["name"] = "Banana"
        parseObject["calories"] = 250
        
        parseObject.saveInBackground { isSuccess, error in
            if error != nil {
                print(error?.localizedDescription)
                
            }else{
                print("success")
            }
        }
        
    }


}

