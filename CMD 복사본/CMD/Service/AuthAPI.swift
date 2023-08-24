import Foundation
import Moya

enum AuthAPI {
    case login(userId: String, userName: String, password: String)
    case signup(UserInfoModel)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://52.65.160.119:8080")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login/student"
        case .signup:
            return "/signup/student"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .signup:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let userId, let userName, let password):
            return .requestParameters(
                parameters: [
                    "userId": userId,
                    "usernmae": userName,
                    "password": password
                ],
                encoding: JSONEncoding.default
            )
        case .signup:
            return .requestParameters(
                parameters: [
                    "userId": UserInfoModel.shared.userId!,
                    "password": UserInfoModel.shared.password!,
                    "username": UserInfoModel.shared.username!,
                    "userEmail": UserInfoModel.shared.userEmail!,
                    "grader": UserInfoModel.shared.grader!,
                    "schoolClass": UserInfoModel.shared.schoolClass!,
                    "number": UserInfoModel.shared.number!,
                    "majorType": UserInfoModel.shared.majorType!,
                    "club": UserInfoModel.shared.club!,
                    "year": UserInfoModel.shared.year!,
                    "month": UserInfoModel.shared.month!,
                    "day": UserInfoModel.shared.day!,
                ], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
