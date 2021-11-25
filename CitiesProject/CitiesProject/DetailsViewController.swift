//
//  DetailsViewController.swift
//  CitiesProject
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imagePath: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityRegion: UILabel!
    
    
    var selectedCity : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityName.text = selectedCity?.name
        imagePath.text = selectedCity?.imagePath
        cityRegion.text = selectedCity?.region

        // Do any additional setup after loading the view.
    }
    

    

}
