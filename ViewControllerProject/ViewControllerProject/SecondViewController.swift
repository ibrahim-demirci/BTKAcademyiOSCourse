//
//  SecondViewController.swift
//  ViewControllerProject
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var findedPassLabel: UILabel!
    
    var gettedPass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findedPassLabel.text = gettedPass
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
