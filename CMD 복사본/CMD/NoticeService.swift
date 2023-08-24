import Alamofire
import SwiftyJSON
import PromiseKit

class NoticeService {
    static func fetchNoticeList(withToken token: String) -> Promise<[myNotice]> {
        let baseURL = "http://52.65.160.119:8080"
        let noticeListURL = URL(string: "\(baseURL)/notification/list")!
        
        return Promise { seal in
            let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
            
            AF.request(noticeListURL, headers: headers)
                .responseJSON(queue: .main) { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601 // Date 형식 지정
                            let notices = try decoder.decode([myNotice].self, from: data)
                            seal.fulfill(notices)
                        } catch {
                            seal.reject(error)
                        }
                    } else {
                        seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
