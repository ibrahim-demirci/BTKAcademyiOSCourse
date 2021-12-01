//
//  main.swift
//  SwiftProtocolProject
//
//  Created by İbrahim Demirci on 1.12.2021.
//

import Foundation

protocol Running{
    func myRun()
    
}

class Animal {
    func test(){
        print("test")
    }
    
}

class Dog : Running{
    func myRun() {
        print("running")
    }
}
class Cat : Animal,Running{
    func myRun() {
        print("running")
    }
}

struct Bird : Running{
    
    func myRun() {
        print("bird running")
    }
}


let barley = Dog()
barley.myRun()

let cat = Cat()
cat.test()
cat.myRun()

let bird = Bird()
bird.myRun()







