import Foundation

// MARK: - MealModel
struct MealModel: Codable {
    let menu: [Menu]
}

// MARK: - Menu
struct Menu: Codable {
    let date: String
    let breakfast, lunch, dinner: [String]
}
