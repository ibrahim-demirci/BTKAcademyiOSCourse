import UIKit

// Loops

// While Loop

5 == 5
5 == 4
5 != 6
3 < 9
3 < 2
2 >= 2


var x = 0
 
x = x + 1
x += 1


while x < 10 {
    print(x)
    x = x + 1
    }


// For Loop

var myArray = ["Atıl","Ahmet","İbrahim","Zeynep"]

for name in myArray{
    print(name.uppercased())
}


var numArray = [10,20,30,40,50]

for num in numArray{
    print(num*5)
}
 
for newNum in 1...10{
    print(newNum)
}


// If Conditions
  
3 == 3


// AND &&
// OR ||

3 == 3 && 4 == 4
2 == 44 || 1 == 1

var myAge = 100

if myAge < 20{
    print("too young")
}else if myAge < 30{
    print("you are in twenties")
}else {
    print("who are you bro")
}
 



