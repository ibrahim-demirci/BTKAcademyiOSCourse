//
//  UserClass.swift
//  AdvanceLevelSwift
//
//  Created by İbrahim Demirci on 1.12.2021.
//

import Foundation


class UserClass{
    
    var name : String
    var age : Int
    var business : String
    
    
    init(name: String, age: Int, business: String) {
        self.name = name
        self.age = age
        self.business = business
    }
    
    func increaseAge(){
        self.age += 1
        
    }
  
    
    
}
