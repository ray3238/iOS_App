
var sortedNumbers: [Int] = [0, 31, 24, 10, 1, 9]

var sorted = sortedNumbers.sorted()
print(sorted[sortedNumbers.count-2] * sorted[sortedNumbers.count-1])

