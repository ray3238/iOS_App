var s1: [String] = ["a", "b", "c"]
var s2: [String] = ["com", "b", "d", "p", "c"]

var s3: Int = 0

s3 = s1.filter { $0.contains(s2) }.count

