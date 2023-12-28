import Foundation
import Moya

enum JokesListAPI {
    case jokesList
}

extension JokesListAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://official-joke-api.appspot.com")!

    }

    var path: String {
        switch self {
        case .jokesList:
            return "/random_ten"
        }
    }

    var method: Moya.Method {
        switch self {
        case .jokesList:
            return .get
        }
    }

    var task: Moya.Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return nil
    }
}
