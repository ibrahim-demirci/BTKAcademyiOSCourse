//
//  main.swift
//  AdvanceLevelSwift
//
//  Created by İbrahim Demirci on 1.12.2021.
//

import Foundation

print("Hello, World!")


//Struct -> no inheritanca | stack(RAM) - FILO , faster, basic, value type, immutable
//Class -> intheritance available | heap(RAM) - FIFO - reference type, mutable, objective-c

let ibrahimClass = UserClass(name: "ibrahim",age: 21,business:"developer")
var ibrahimStruct = UserStruct(name: "ibrahim", age: 30, business: "engineer")

print(ibrahimClass.name)
print(ibrahimStruct.name)



ibrahimClass.age = 33
print(ibrahimClass.age)

ibrahimStruct.age = 35
print(ibrahimStruct.age)


// Reference diff Value

let ibrahimClassCopy = ibrahimClass
var ibrahimStructCopy = ibrahimStruct

print(ibrahimClassCopy.age)
print(ibrahimStructCopy.age)

ibrahimClassCopy.age = 55
ibrahimStructCopy.age = 55

print(ibrahimClass.age)
print(ibrahimStruct.age)















