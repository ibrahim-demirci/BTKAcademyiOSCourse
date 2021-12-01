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


//ibrahimClass.age = 33
//print(ibrahimClass.age)

//ibrahimStruct.age = 35
//print(ibrahimStruct.age)


// Reference diff Value

//let ibrahimClassCopy = ibrahimClass
//var ibrahimStructCopy = ibrahimStruct

//print(ibrahimClassCopy.age)
//print(ibrahimStructCopy.age)

//ibrahimClassCopy.age = 55
//ibrahimStructCopy.age = 55

//print(ibrahimClass.age)
//print(ibrahimStruct.age)

print(ibrahimClass.age)
ibrahimClass.increaseAge()
print(ibrahimClass.age)


print(ibrahimStruct.age)
ibrahimStruct.increaseAge()
print(ibrahimStruct.age)


//Tuple

var tuple = (10,20)
print(tuple.0)

var myTuple = (10,"text",true)
print(myTuple.2)

let myTuple2 = ("test",[1,2,3,4])
print(myTuple2.1[2])

let myNum : Int?
let tupleDefined : (String,String)
tupleDefined.1 = "test"


let newTuple = (name:"ibrahim", surname: "demirci")
print(newTuple.name)
  

// Guard Let

let num = "5"

func convertToIntUsingIfLet(num : String) -> Int{
    if let myInt = Int(num){
        return myInt
    }else{
        return 0
    }
}

func convertToIntUsingGuardLet(num : String) -> Int{
    guard let myInt = Int(num) else {
        return 0
    }
    return myInt
}
print(convertToIntUsingIfLet(num: num))
print(convertToIntUsingGuardLet(num: num))














