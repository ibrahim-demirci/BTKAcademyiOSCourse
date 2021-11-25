//
//  ViewController.swift
//  Counter
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var time = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.time = 5
        label.text = "Time \(time)"
        
        
    }
    


    @IBAction func start(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    
    @objc func timerFunc (){
        
        label.text = "Time : \(self.time)"
        time = time - 1
        if time == 0{
            label.text = "End"
            timer.invalidate()
            time = 15
        }
    }
    
}

