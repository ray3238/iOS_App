import Foundation

class UserInfoModel: Decodable {
    static let shared = UserInfoModel()
    var userId: String?
    var password: String?
    var username: String?
    var userEmail: String?
    var grader: Int?
    var schoolClass: Int?
    var number: Int?
    var majorType: String?
    var club: String?
    var year: Int?
    var month: Int?
    var day: Int?
    
    private init() { }
}
