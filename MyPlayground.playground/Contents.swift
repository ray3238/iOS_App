//var phone_number: String = "1234567890"

//var count: Int = phone_number.count
//var answer: String = ""
//count = count - 4
//for i in count {
//answer: String += "*"
//}
//answer += phone_number.suffix(4)

// MARK:
//print("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")

var my_string: String = "ab3n2j3n4"

func abc() {
    var a = Array(my_string)
    var sum: Int = a.compactMap { Int(String($0)) }.reduce(0, +)
}

//return my_string.compactMap{Int(String($0))}.reduce(0,+)
//return my_string.filter{$0.isNumber}.map{Int(String($0))!}.reduce(0, +)

abc();
