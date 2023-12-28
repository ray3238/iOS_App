import Foundation
import RxSwift
import RxCocoa

class JokesListViewModel: ViewModelType {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let bool: Driver<Bool>
        //        let id: Driver<Int>
        //        let name: Driver<String>
        //        let logoUrl: Driver<URL>
        //        let military: Driver<Bool>
        //        let jobCodeList: Driver<String>
    }
    
    struct Output {
        let jokesListEntities: PublishRelay<[JokesListEntities]>
        let result: PublishRelay<Bool>
//        let error: PublishRelay<companyListError>
    }
    
    func transform(_ input: Input) -> Output {
        let api = JokesListService()
        let result = PublishRelay<Bool>()
        let jokesListEntities =  PublishRelay<[JokesListEntities]>()

        input.bool.asObservable()
            .flatMap {_ in
                api.jokesList()
            }.subscribe(onNext: { response, statusType in
                switch statusType {
                case .ok:
                    jokesListEntities.accept(response)
                    result.accept(true)
                default:
                    result.accept(false)
                }
            }).disposed(by: disposeBag)
        return Output(jokesListEntities: jokesListEntities, result: result)
    }
    
}
