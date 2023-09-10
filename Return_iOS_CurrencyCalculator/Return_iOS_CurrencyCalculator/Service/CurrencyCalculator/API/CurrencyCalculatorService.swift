import Foundation
import Moya

// 의존성이 없게 해야하는데..

//임의의 변수 설정
//let date: String = "2023-09-07"
//

enum CurrencyCalculatorAPI {
    case CurrencyAPI(fromCurrency: String, toCurrency: String)
}

extension CurrencyCalculatorAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/")!
        
    }
    
    var path: String {
        switch self {
        case .CurrencyAPI(let fromCurrency, let toCurrency):
            return "\(fromCurrency)/\(toCurrency).json"
        }
    }
    
    var method: Moya.Method {
            return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
//        switch self {
//        case .currencyCalculatorAPI(let date, let toCurrency):
//            let params: [String: Any] =
//            [
//                "date": date,
//                "\(CurrencyCountryInfo.shared.toCountry)": toCurrency
//            ]
//            return .requestParameters(
//                parameters: params, encoding: URLEncoding.queryString)
//        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
        
