//
//  EditInfoViewControllerViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/17.
//

import UIKit
import SnapKit
import Then
import Alamofire

class EditInfoViewController: UIViewController {
    
    let editInfoLabel = UILabel().then {
        $0.text = "내 정보 수정"
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    }
    let nameLabel = UILabel().then {
        $0.text = "이름"
    }
    let exNameLabel = UILabel().then {
        $0.text = "ex) 홍길동"
        $0.textColor = .lightGray
    }
    var nameTextField = UITextField().then {
        $0.text = "이태규"
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }

    //*************************
    var gradeTextField = UITextField().then {
        $0.text = "1"
        $0.textColor = .black
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    private let gradeLabel = UILabel().then {
        $0.text = "학년"
        $0.textColor = .black
    }
    
    var schoolClassTextField = UITextField().then {
        $0.text = "2"
        $0.textColor = .black
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    private let schoolClassLabel = UILabel().then {
        $0.text = "반"
        $0.textColor = .black
    }
    
    var classNumberTextField = UITextField().then {
        $0.text = "3"
        $0.textColor = .black
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    private let classNumberLabel = UILabel().then {
        $0.text = "번호"
        $0.textColor = .black
    }
    //**************************
    
    
    
    let birthDayLabel = UILabel().then {
        $0.text = "생년월일"
    }
    let exBirthDayLabel = UILabel().then {
        $0.text = "ex) 70410"
        $0.textColor = .lightGray
    }
    var birthDayTextField = UITextField().then {
        $0.text = "70410"
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    
    let fieldOfStudyLabel = UILabel().then {
        $0.text = "전공분야"
    }
    let exFieldOfStudyLabel = UILabel().then {
        $0.text = "ex) IOS"
        $0.textColor = .lightGray
    }
    var fieldOfStudyTextField = UITextField().then {
        $0.text = "IOS"
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    
    let majorClubLabel = UILabel().then {
        $0.text = "전공 동아리"
    }
    let exMajorClubLabel = UILabel().then {
        $0.text = "ex) RMA"
        $0.textColor = .lightGray
    }
    var majorClubTextField = UITextField().then {
        $0.text = "RMA"
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    
    let editInfoSuccessButton = UIButton().then {
        $0.setTitle("수정 완료", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = UIColor(named: "Main1")
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 5
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubView()
        setLayout()
    }
    
    
    func addSubView() {
        [
            editInfoLabel,
            nameLabel,
            exNameLabel,
            nameTextField,
            gradeLabel,
            gradeTextField,
            schoolClassLabel,
            schoolClassTextField,
            classNumberLabel,
            classNumberTextField,
            birthDayLabel,
            exBirthDayLabel,
            birthDayTextField,
            fieldOfStudyLabel,
            exFieldOfStudyLabel,
            fieldOfStudyTextField,
            majorClubLabel,
            exMajorClubLabel,
            majorClubTextField,
            editInfoSuccessButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        editInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.left.equalToSuperview().inset(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(editInfoLabel).inset(160)
            $0.left.equalToSuperview().inset(40)
        }
        exNameLabel.snp.makeConstraints {
            $0.top.equalTo(editInfoLabel).inset(160)
            $0.left.equalTo(nameLabel).inset(36)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel).inset(27)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(40)
            $0.bottom.equalTo(gradeLabel).inset(35)
        }

        //*************
        gradeTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(70)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalTo(schoolClassTextField).inset(130)
            $0.bottom.equalTo(birthDayLabel).inset(45)
        }
        gradeLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(50)
            $0.left.equalToSuperview().inset(40)
//            $0.right.equalTo(schoolClassLabel).inset(80)
        }
        
        schoolClassTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(70)
            $0.left.equalTo(gradeTextField).inset(120)
            $0.right.equalTo(classNumberTextField).inset(130)
            $0.bottom.equalTo(birthDayLabel).inset(45)
        }
        schoolClassLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(50)
            $0.left.equalTo(gradeLabel).inset(120)
//            $0.right.equalTo(classNumberLabel).inset(80)
        }
        
        classNumberTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(70)
            $0.left.equalTo(schoolClassTextField).inset(130)
            $0.right.equalToSuperview().inset(40)
            $0.bottom.equalTo(birthDayLabel).inset(45)
        }
        classNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(50)
            $0.left.equalTo(schoolClassLabel).inset(130)
            $0.right.equalToSuperview().inset(80)
        }
        //*************
        
        
        birthDayLabel.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(70)
            $0.left.equalToSuperview().inset(40)
        }
        exBirthDayLabel.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(70)
            $0.left.equalTo(nameLabel).inset(65)
        }
        birthDayTextField.snp.makeConstraints {
            $0.top.equalTo(birthDayLabel).inset(27)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(40)
            $0.bottom.equalTo(fieldOfStudyLabel).inset(45)
        }
        
        fieldOfStudyLabel.snp.makeConstraints {
            $0.top.equalTo(birthDayTextField).inset(70)
            $0.left.equalToSuperview().inset(40)
        }
        exFieldOfStudyLabel.snp.makeConstraints {
            $0.top.equalTo(birthDayTextField).inset(70)
            $0.left.equalTo(nameLabel).inset(65)
        }
        fieldOfStudyTextField.snp.makeConstraints {
            $0.top.equalTo(fieldOfStudyLabel).inset(27)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(40)
            $0.bottom.equalTo(majorClubLabel).inset(45)
        }
        
        majorClubLabel.snp.makeConstraints {
            $0.top.equalTo(fieldOfStudyTextField).inset(70)
            $0.left.equalToSuperview().inset(40)
        }
        exMajorClubLabel.snp.makeConstraints {
            $0.top.equalTo(fieldOfStudyTextField).inset(70)
            $0.left.equalTo(nameLabel).inset(85)
        }
        majorClubTextField.snp.makeConstraints {
            $0.top.equalTo(majorClubLabel).inset(27)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(40)
            $0.bottom.equalTo(editInfoSuccessButton).inset(110)
        }
        
        editInfoSuccessButton.snp.makeConstraints {
            $0.top.equalTo(majorClubTextField).inset(115)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(100)
        }
    }
}
