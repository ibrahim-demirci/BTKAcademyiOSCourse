//
//  main.swift
//  SwiftOOP
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import Foundation

let katarina = SuperUser(name: "Katarina", age: 35, work: "Worker",type: .AdminUser)
let john = User(name: "John", age: 35, work: "Engineer", type: .NormalUser)

katarina.sampleFunc()
katarina.newFunc()

print(katarina.type)


print(john.name)
print(john.getHairColor())
