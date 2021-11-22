import UIKit


// Collections

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
