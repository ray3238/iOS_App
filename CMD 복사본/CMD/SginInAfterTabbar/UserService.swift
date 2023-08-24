import Alamofire

class UserService {
    func fetchUserInfoFromServer(completion: @escaping (Result<UserInfoModel, Error>) -> Void) {
        let baseURL = "http://52.65.160.119:8080"
        let userInfoURL = URL(string: "\(baseURL)/student")!

        AF.request(userInfoURL, method: .get).responseDecodable(of: UserInfoModel.self) { response in
            switch response.result {
            case .success(let userInfo):
                completion(.success(userInfo))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
