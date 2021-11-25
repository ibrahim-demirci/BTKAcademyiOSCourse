//
//  SuperUser.swift
//  SwiftOOP
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import Foundation

class SuperUser : User{
    
    func newFunc(){
        
        print("new func called")
    }
    
    override func sampleFunc() {
        super.sampleFunc()
        print("sample func from SuperUser")
    }
    

}
