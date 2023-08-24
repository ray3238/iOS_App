//
//  StudentInfoModalViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/24.
//

import UIKit

class StudentInfoModalViewController: UIViewController {
    
    private let profileTitleImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.image = UIImage(named: "MainLogo")
        $0.backgroundColor = UIColor(named: "Main1")
    }
    
    var profileTitleNameLabel = UILabel().then {
        $0.text = "의지니"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    private let profileInfoLabel = UILabel().then {
        $0.text = "회원 정보"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.textColor = .white
    }
    var profileNameLabel = UILabel().then {
        $0.text = "의지니"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let classNumLabel = UILabel().then {
        $0.text = "학번"
        $0.textColor = .white
    }
    var profileClassNumLabel = UILabel().then {
        $0.text = "1211"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let birthdayLabel = UILabel().then {
        $0.text = "생년월일"
        $0.textColor = .white
    }
    var profileBirthdayLabel = UILabel().then {
        $0.text = "070910"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let fieldOfStudyLabel = UILabel().then {
        $0.text = "전공 분야"
        $0.textColor = .white
    }
    var profileFieldOfStudyLabel = UILabel().then {
        $0.text = "Frontend"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let majorClubLabel = UILabel().then {
        $0.text = "전공 동아리"
        $0.textColor = .white
    }
    var profileMajorClubLabel = UILabel().then {
        $0.text = "RMA"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    private let seatLabel = UILabel().then {
        $0.text = "자리 배치"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main1")
        // Do any additional setup after loading the view.
        addSubView()
        setLayout()
    }
    
    func addSubView() {
        [
            profileTitleImageView,
            profileTitleNameLabel,
            profileInfoLabel,
            nameLabel,
            profileNameLabel,
            classNumLabel,
            profileClassNumLabel,
            birthdayLabel,
            profileBirthdayLabel,
            fieldOfStudyLabel,
            profileFieldOfStudyLabel,
            majorClubLabel,
            profileMajorClubLabel,
            seatLabel
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
        seatLabel.snp.makeConstraints {
            $0.top.equalTo(majorClubLabel).inset(80)
            $0.left.equalToSuperview().inset(40)
        }
    }
    
}
