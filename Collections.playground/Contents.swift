import UIKit


// Collections


// Arrays
var firstArray = ["Atil","Zeynep","Mehmet","Hülya"]

// Index
firstArray[0]
firstArray[3]
firstArray[0] = "İbrahim"

var secondArray = [10,20,30,40]
secondArray[2] * 5

var mixedArray = [10,"Atil",true] as [Any]

// as -> casting, any -> object

var newVariable = mixedArray[1] as! String

mixedArray.append("Zeynep")
mixedArray[mixedArray.count-2]
mixedArray.last

var numArray = [5,2,1,6,9,10]
numArray.sort()


var letterArray = ["a","j","o"]
letterArray.sort()


// Set

var nums = [1,1,1,1,1,1,2,3,4,5,6]

var numSet:Set = [1,1,1,1,1,2,3,4,5,6]
numSet.remove(3)


var ordersArray = ["istanbul","ankara","adana","adana","istanbul"]
var ordersSet = Set(ordersArray)
ordersSet.count

let firstSet :Set = [40,50,60]
let secondSet :Set = [50,60,70]


let migratedSet = firstSet.union(secondSet)
