//
//  MyPageViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/16.
//

import UIKit
import SnapKit
import Then
import Alamofire


class MyPageViewController: UIViewController {
    
//    var userInfo: UserInfoModel?
    var classNum: String = ""
    
    let EditInfoVC = EditInfoViewController()
    
    private let profileTitleImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.image = UIImage(named: "MainLogo")
    }
    
    var profileTitleNameLabel = UILabel().then {
        $0.text = "의지니"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    private let profileInfoLabel = UILabel().then {
        $0.text = "회원 정보"
        $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }
    private let editProfileButton = UIButton().then {
        $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = .systemRed
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.red.cgColor
        $0.layer.cornerRadius = 5
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 1
    }
    private let nameLabel = UILabel().then {
        $0.text = "이름"
    }
    var profileNameLabel = UILabel().then {
        $0.text = "의지니"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let classNumLabel = UILabel().then {
        $0.text = "학번"
    }
    var profileClassNumLabel = UILabel().then {
        $0.text = "1211"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let birthdayLabel = UILabel().then {
        $0.text = "생년월일"
    }
    var profileBirthdayLabel = UILabel().then {
        $0.text = "070910"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let fieldOfStudyLabel = UILabel().then {
        $0.text = "전공 분야"
    }
    var profileFieldOfStudyLabel = UILabel().then {
        $0.text = "Frontend"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let majorClubLabel = UILabel().then {
        $0.text = "전공 동아리"
    }
    var profileMajorClubLabel = UILabel().then {
        $0.text = "RMA"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubView()
        setLayout()
        fetchUserInfo()
        self.editProfileButton.addTarget(self, action: #selector(self.editProfile), for: .touchUpInside)
        self.logoutButton.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
        
        
    }
    
    
    private func fetchUserInfo() {
        guard let authToken = authToken else {
            showAlert(title: "오류", message: "토큰이 없습니다.")
            return
        }
        
        let userInfoURL = "http://52.65.160.119:8080/student"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(authToken)"
        ]
        
        AF.request(userInfoURL, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    if let json = data as? [String: Any] {
                        self.showUserInfo(json: json)
                    } else {
                        self.showAlert(title: "오류", message: "사용자 정보를 가져올 수 없습니다.")
                    }
                    
                case .failure(let error):
                    self.showAlert(title: "오류", message: "네트워크 또는 서버 오류가 발생했습니다.")
                    print("Fetching user info failed with error: \(error)")
                }
            }
    }
    func addLeadingZeroIfNeeded(number: Int) -> String {
        return number < 10 ? "0\(number)" : "\(number)"
    }
    private func showUserInfo(json: [String: Any]) {
        // 서버로부터 받아온 사용자 정보를 화면에 표시
        profileTitleNameLabel.text = "\(json["username"] as? String ?? "")"
        profileNameLabel.text = "\(json["username"] as? String ?? "")"
        
        if let grade = json["grader"] as? Int,
           let schoolClass = json["schoolClass"] as? Int,
           let number = json["number"] as? Int {
            let classCodeString = String(grade) + String(schoolClass) + addLeadingZeroIfNeeded(number: number)
            profileClassNumLabel.text = classCodeString
        } else {
            profileClassNumLabel.text = "정보 없음"
        }

        if let year = json["year"] as? Int,
           let month = json["month"] as? Int,
           let day = json["day"] as? Int {
            let dateString = String(year) + "." + String(format: "%02d", month) + "." + String(format: "%02d", day)
            profileBirthdayLabel.text = dateString
        } else {
            profileBirthdayLabel.text = "정보 없음"
        }
        profileFieldOfStudyLabel.text = "\(json["majorType"] as? String ?? "")"
        profileMajorClubLabel.text = "\(json["club"] as? String ?? "")"
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    

    
    @objc func editProfile() {
        self.navigationController?.pushViewController(EditInfoViewController(), animated: true)
    }
    
    @objc func logout() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        UserDefaults.standard.synchronize()
        
        self.navigationController?.pushViewController(SginInViewController(), animated: true)
    }
    
    func addSubView() {
        [
            profileTitleImageView,
            profileTitleNameLabel,
            profileInfoLabel,
            editProfileButton,
            logoutButton,
            nameLabel,
            profileNameLabel,
            classNumLabel,
            profileClassNumLabel,
            birthdayLabel,
            profileBirthdayLabel,
            fieldOfStudyLabel,
            profileFieldOfStudyLabel,
            majorClubLabel,
            profileMajorClubLabel
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        profileTitleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.left.equalToSuperview().inset(175)
        }
        profileTitleNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileTitleImageView).inset(90)
            $0.left.equalToSuperview().inset(178)
        }
        profileInfoLabel.snp.makeConstraints {
            $0.top.equalTo(profileTitleNameLabel).inset(65)
            $0.left.equalToSuperview().inset(40)
        }
        editProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileTitleNameLabel).inset(67)
            $0.left.equalTo(profileInfoLabel).inset(86)
        }
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(profileTitleNameLabel).inset(60)
            $0.left.equalTo(editProfileButton).inset(184)
            $0.right.equalToSuperview().inset(35)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileInfoLabel).inset(55)
            $0.left.equalToSuperview().inset(40)
        }
        profileNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileInfoLabel).inset(55)
            $0.left.equalToSuperview().inset(125)
        }
        classNumLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel).inset(45)
            $0.left.equalToSuperview().inset(40)
        }
        profileClassNumLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel).inset(45)
            $0.left.equalToSuperview().inset(125)
        }
        birthdayLabel.snp.makeConstraints {
            $0.top.equalTo(classNumLabel).inset(45)
            $0.left.equalToSuperview().inset(40)
        }
        profileBirthdayLabel.snp.makeConstraints {
            $0.top.equalTo(classNumLabel).inset(45)
            $0.left.equalToSuperview().inset(125)
        }
        fieldOfStudyLabel.snp.makeConstraints {
            $0.top.equalTo(birthdayLabel).inset(45)
            $0.left.equalToSuperview().inset(40)
        }
        profileFieldOfStudyLabel.snp.makeConstraints {
            $0.top.equalTo(birthdayLabel).inset(45)
            $0.left.equalToSuperview().inset(125)
        }
        majorClubLabel.snp.makeConstraints {
            $0.top.equalTo(fieldOfStudyLabel).inset(45)
            $0.left.equalToSuperview().inset(40)
        }
        profileMajorClubLabel.snp.makeConstraints {
            $0.top.equalTo(fieldOfStudyLabel).inset(45)
            $0.left.equalToSuperview().inset(125)
        }
    }
}


//    func fetchUserInfo() {
//        let userInfoURL = "http://52.65.160.119:8080/student"
//
//        AF.request(userInfoURL, method: .get)
//            .validate()
//            .responseJSON { [self] response in
//                switch response.result {
//                case .success(let data):
//                    // 사용자 정보 조회 성공한 경우 서버에서 반환한 사용자 정보를 처리하는 코드
//                    if let json = data as? [String: Any] {
//                        // 사용자 정보를 얻었습니다.
//                        if let name = json["name"] as? String {
//                            self.profileNameLabel.text = "\(name)"
//                        }
//                        if let grade = json["grader"] as? String {
//                            classNum = "\(grade)"
//                        }
//                        if let schoolClass = json["schoolClass"] as? String {
//                            classNum = classNum + "\(schoolClass)"
//                        }
//                        if let number = json["number"] as? String {
//                            classNum = classNum + "\(number)"
//                            self.profileClassNumLabel.text = classNum
//                        }
//                        if let birth = json["birth"] as? String {
//                            self.profileBirthdayLabel.text = "\(birth)"
//                        }
//                        if let majorType = json["majorType"] as? String {
//                            self.profileFieldOfStudyLabel.text = "\(majorType)"
//                        }
//                        if let club = json["club"] as? String {
//                            self.profileMajorClubLabel.text = "\(club)"
//                        }
//                    } else {
//                        print("Invalid response format")
//                    }
//
//                case .failure(let error):
//                    print("User info fetching failed with error: \(error)")
//                }
//            }
//    }
