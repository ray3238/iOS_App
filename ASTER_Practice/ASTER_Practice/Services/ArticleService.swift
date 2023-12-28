import Foundation
import UIKit
import Moya

enum API {
    case fetchNews(Void)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-09-11&sortBy=publishedAt&apiKey=")!
    }
    
    var path: String {
        switch self {
        case .fetchNews():
            return "82fd17685db44ee0888a423add07da9c"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
//        return .requestParameters
//        (parameters:
//            [
//                "author": Article.shared.author!,
//                "title": Article.shared.title!,
//                "description": Article.shared.description!,
//                "url": Article.shared.url!,
//                "urlToImage": Article.shared.urlToImage!,
//                "publishedAt": Article.shared.publishedAt!,
//                "content": Article.shared.content!
//            ],
//         encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
//class ArticleService {
//
//}
