//
//  main.swift
//  SwiftOOP
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import Foundation

let katarina = SuperUser(name: "Katarina", age: 35, work: "Worker",type: .AdminUser)
let john = User(name: "John", age: 35, work: "Engineer", type: .NormalUser)

print("\(katarina.name)")
katarina.sampleFunc()
print(katarina.type)
katarina.newFunc()
print(john.name)
