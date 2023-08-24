//
//  NotificationModalViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/24.
//

import UIKit
import SnapKit
import Then
import Alamofire

class NotificationModalViewController: UIViewController {

//    var notificationId: Int?
    var notificationTitle: String?
    var notificationContent: String?
    
    let titleLabel = UILabel().then {
        $0.lineBreakMode = .byCharWrapping
        $0.numberOfLines = 0
        $0.text = "대충 제목 대충 제목 대충 제목"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    let titleLineUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.black // 밑줄 색상 설정
    }
    let notiFicationDateLabel = UILabel().then {
        $0.text = "2023.07.17 오전 12:57"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textColor = .gray
    }
    
    let contentLabel = UILabel().then {
        $0.lineBreakMode = .byCharWrapping
        $0.numberOfLines = 0
        $0.text = "대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용 대충 내용"
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main1")
        
        // Do any additional setup after loading the view.
        addSubView()
        setLayout()
        titleLabel.text = notificationTitle
        contentLabel.text = notificationContent
    }

    func addSubView() {
        [
            titleLabel,
            titleLineUnderlineView,
            notiFicationDateLabel,
            contentLabel
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        titleLineUnderlineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).inset(29)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(titleLabel).inset(-6)
        }
        notiFicationDateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLineUnderlineView).inset(7)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(notiFicationDateLabel).inset(40)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
    }
    
//    private func fetchNotificationDetail() {
//            guard let notificationId = notificationId else {
//                return
//            }
//
//            let notificationDetailURL = "http://52.65.160.119:8080/notificatoin/\(notificationId)"
//
//            AF.request(notificationDetailURL)
//                .validate()
//                .responseJSON { response in
//                    switch response.result {
//                    case .success(let data):
//                        if let json = data as? [String: Any],
//                           let title = json["title"] as? String,
//                           let content = json["content"] as? String,
//                           let expiredAt = json["expiredAt"] as? String{
//                            self.titleLabel.text = title
//                            self.contentLabel.text = content
//                            self.notiFicationDateLabel.text = expiredAt
//                        } else {
//                            self.showAlert(title: "오류", message: "공지사항 정보를 가져올 수 없습니다.")
//                        }
//
//                    case .failure(let error):
//                        self.showAlert(title: "오류", message: "네트워크 또는 서버 오류가 발생했습니다.")
//                        print("Fetching notification detail failed with error: \(error)")
//                    }
//                }
//        }
//
//        private func showAlert(title: String, message: String) {
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//            alertController.addAction(okAction)
//            present(alertController, animated: true, completion: nil)
//        }
}
