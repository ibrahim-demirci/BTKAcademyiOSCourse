//
//  City.swift
//  CitiesProject
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import Foundation

class City{
    
    var imagePath: String = ""
    var name : String = ""
    var region : String = ""
    
    
    init(imagePath:String, name: String, region: String) {
        self.imagePath = imagePath
        self.name = name
        self.region = region
    
    }
    
    
}
