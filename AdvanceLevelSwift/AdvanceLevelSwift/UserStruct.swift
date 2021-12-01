//
//  UserStruct.swift
//  AdvanceLevelSwift
//
//  Created by İbrahim Demirci on 1.12.2021.
//

import Foundation


struct UserStruct {
    
    var name : String
    var age : Int
    var business : String
    
    
    mutating func increaseAge(){
        self.age += 1
    }
    
}
