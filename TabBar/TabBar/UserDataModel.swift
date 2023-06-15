import Foundation

// MARK: - UserDataModel
struct UserDataModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let gender: String
    let name: Name
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - UserDataModel
struct UserDataEntity: Equatable {
    var results: [ResultEntity]
}

// MARK: - Result
struct ResultEntity: Equatable {
    var gender: String
    var name: NameEntity
}

// MARK: - Name
struct NameEntity: Equatable {
    let title, first, last: String
}
