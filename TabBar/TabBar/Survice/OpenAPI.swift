import Foundation
import Moya

enum OpenAPI {
    case randomUser()
}

extension OpenAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://randomuser.me/")!
    }
    
    var path: String {
        switch self {
        case .randomUser():
            return "api/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .randomUser():
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .randomUser():
            return .requestParameters(
                parameters: [
                    "userId": userId,
                    "usernmae": userName,
                    "password": password
                ],
                encoding: JSONEncoding.default
            )
        }
        
        var headers: [String : String]? {
            return nil
        }
    }
}
