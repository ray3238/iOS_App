import Foundation

// Model에 해당한다.
class User {
    init(
        name: String,
        age: Int,
        job: String
    ) {
        self.name = name
        self.age = age
        self.job = job
    }

    let name: String
    let age: Int
    let job: String
}
