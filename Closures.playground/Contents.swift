import UIKit

var greeting = "Hello, playground"

//Closure
//No named functions

func sum(x: Int, y: Int ) -> Int{
    return x+y
}

sum(x: 2, y: 5)

//Sum -> (Int,Int) -> Int
func calculate(num1: Int, num2: Int,myFunc : (Int,Int) -> Int) ->Int {
    return myFunc(num1,num2)
}
calculate(num1: 5, num2: 10, myFunc: sum)

calculate(num1: 30, num2: 20, myFunc: {
    (x: Int, y: Int ) -> Int in
    return x*y
})

calculate(num1: 4, num2: 2, myFunc: {
    (x,y) -> Int in
    return x*y
})

calculate(num1: 4, num2: 2, myFunc: {
    (x,y)  in
    return x*y
})

calculate(num1: 4, num2: 2, myFunc: { (x,y) in x*y })

calculate(num1: 4, num2: 2, myFunc: { $0 * $1 })

let myArray = [10,20,30,40]

func test(num1: Int) ->Int{
    return num1/5
}

myArray.map(test)

myArray.map({$0 / 5})
