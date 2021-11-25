//
//  User.swift
//  SwiftOOP
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import Foundation

enum UserType{
    case AdminUser
    case NormalUser
    case NoPermissionUser
}

class User {
    
    var name :String
    var age :Int
    var work :String
    var type : UserType
    
    
    
    //Initializer
    
    init(name : String, age : Int, work : String, type : UserType) {
        
        self.name = name
        self.age = age
        self.work = work
        self.type = type

    }
    
    func sampleFunc(){
        print("sampleFunc Called")
    }
    
}
