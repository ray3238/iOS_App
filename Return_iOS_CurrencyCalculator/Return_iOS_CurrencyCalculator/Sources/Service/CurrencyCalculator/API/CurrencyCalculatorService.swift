import Foundation
import Moya

// 의존성이 없게 해야하는데..

enum CurrencyCalculatorAPI {
    case CurrencyAPIUsd(fromCurrency: String, toCurrency: String)
    case CurrencyAPIKrw(fromCurrency: String, toCurrency: String)
    case CurrencyAPIJpy(fromCurrency: String, toCurrency: String)
    case CurrencyAPIPhp(fromCurrency: String, toCurrency: String)
}

extension CurrencyCalculatorAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/")!
    }
    
    var path: String {
        switch self {
        case .CurrencyAPIUsd(let fromCurrency, let toCurrency):
            return "\(fromCurrency)/\(toCurrency).json"
        case .CurrencyAPIKrw(let fromCurrency, let toCurrency):
            return "\(fromCurrency)/\(toCurrency).json"
        case .CurrencyAPIJpy(let fromCurrency, let toCurrency):
            return "\(fromCurrency)/\(toCurrency).json"
        case .CurrencyAPIPhp(let fromCurrency, let toCurrency):
            return "\(fromCurrency)/\(toCurrency).json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}

