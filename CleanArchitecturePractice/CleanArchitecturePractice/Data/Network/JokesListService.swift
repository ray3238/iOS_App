import Foundation
import UIKit
import RxSwift
import Moya

final class JokesListService {
    let provider = MoyaProvider<JokesListAPI>(plugins: [MoyaLogginPlugin()])
    
    func jokesList() -> Single<([JokesListEntities], networkingResult)> {
        return provider.rx
            .filterSuccessfulStatusCodes()
            .map(JokesListResponse.self)
            .map { response -> ([JokesListEntities], networkingResult) in
                return (response.toDomain(), .ok)
            }
//            .catch{[unowned self] in return .just(setNetworkError($0)), []}
            .catch { error in
                print(error)
                return 
//                return .just(([], self.setNetworkError(error)))
            }
    }
    
    func setNetworkError(_ error: Error) -> networkingResult {
        print("Error!!", error)
        print(error.localizedDescription)
        guard let status = (error as? MoyaError)?.response?.statusCode else { return (.fault) }
        print(status)
        return (networkingResult(rawValue: status) ?? .fault)
    }
}
