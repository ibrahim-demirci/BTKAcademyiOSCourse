import UIKit

func sampleFunction () {
    print("Test log")
}
sampleFunction()


//Parameter, input
func parameterFunction(a:String){
    print(a)
}
parameterFunction(a: "Parameter Log")


// Output, return
func sum(x:Int,y:Int) -> Int{
    return x + y
}
sum(x: 55, y:44)


func logicFunctiın(x:Int,y:Int) -> Bool{
    if x > y{
        return true
    }else {
        return false
    }
}

logicFunctiın(x: 4, y: 3)


// Optionals
var myName : String?
myName?.uppercased()
myName = "İbrahim"


var inputNum = "İbrahim"

// Force unwrapping
// var res = Int(inputNum)! * 5

var res = Int(inputNum) ?? 1 * 5

if let newResult  = Int(inputNum){
    newResult * 5
}else {
    print("wrong format")
}
  
