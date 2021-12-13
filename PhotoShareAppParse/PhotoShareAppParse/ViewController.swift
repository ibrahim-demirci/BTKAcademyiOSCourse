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
        
//        let parseObject = PFObject(className: "Fruit")
//        parseObject["name"] = "Banana"
//        parseObject["calories"] = 250
//
//        parseObject.saveInBackground { isSuccess, error in
//            if error != nil {
//                print(error?.localizedDescription ?? "error)
//
//            }else{
//                print("success")
//            }
//        }
        
        let query = PFQuery(className: "Fruit")
//        query.whereKey("name", equalTo: "Apple")
        query.whereKey("calories", greaterThan: 120)
        query.findObjectsInBackground { objects, error in
            if error != nil{
                print(error?.localizedDescription)
            } else{
                print(objects)
            }
        }
        
    }


}

