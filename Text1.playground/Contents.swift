import UIKit

//let add: (Int, Int) -> Int
//add = { (a: Int, b: Int) in
//    return a + b
//}
//
//let substract: (Int, Int) -> Int
//substract = { (a: Int, b: Int) in
//    return a - b
//}
//
//let divide: (Int, Int) -> Int
//divide = { (a: Int, b: Int) in
//    return a / b
//}
//
//func calculate(
//    a: Int,
//    b: Int,
//    method: (Int, Int) -> Int
//) -> Int {
//    return method(a, b)
//}
//
//var calculated: Int
//
//let first = 50
//
//let second = 10
//
//calculated = calculate(a: first, b: second, method: add)
//
//print(calculated) // 60
//
//calculated = calculate(a: 50, b: 10, method: substract)
//
//print(calculated) // 40
//
//calculated = calculate(a: 50, b: 10, method: divide)
//
//print(calculated) // 5
//
////따로 클로저를 상수/변수에 넣어 전달하지 않고,
////함수를 호출할 때 클로저를 작성하여 전달할 수도 있습니다.
//
//calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
//    return left * right
//})
//
//print(calculated) // 500

//var a: ((Int,Int) -> Int) = { a, b in
//    return a + b
//}
//
//func c(a: Int, b: Int) -> Int {
//
//}
//
//var b: Int = a(1,3)
//b = c
//
//print(b)

//var a: [Int] = [9, -1, 0]
//a.sort()
//var b: Int = a.count
//print(b/2+1)

//var a: [Int] = sides
//    a.sort()
//    if sides{$0 + $1 < $2}  {
//        return 1
//    } else {
//        return 2
//    }

var my_string: [String] = ["HelloWorld!"]

var a: String = my_string.reversed()
