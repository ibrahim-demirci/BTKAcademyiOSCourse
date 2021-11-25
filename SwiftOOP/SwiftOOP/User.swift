//
//  User.swift
//  SwiftOOP
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import Foundation

class User {
    
    var name :String = ""
    var age :Int = 0
    var work :String = ""
    
    //Initializer
    
    init(name : String, age : Int, work : String) {
        
        self.name = name
        self.age = age
        self.work = work

    }
    
}
