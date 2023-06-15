func swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var aInt = 3
var bInt = 5

print(aInt, bInt)

swap(&aInt, &bInt)

print(aInt, bInt)

var aString = "3"
var bString = "5"

print(aString, bString)

swap(&aString, &bString)

print(aString, bString)
