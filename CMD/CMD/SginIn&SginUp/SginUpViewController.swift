//
//  ViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/09.
//

import UIKit
import SnapKit
import Then

class SginUpViewController: UIViewController {
    var pwHideCount1 = 0
    var pwHideCount2 = 0
    
    @objc func goSignInButton(_ sender: UIButton) {
        self.goSignInButton.addTarget(self, action: #selector(self.vcSwift), for: .touchUpInside)
    }
    
    // 눈 깜박깜박 부분 버튼 기능
    @objc func sginUpPWHideBtn(_ sender: UIButton) {
        self.sginUpPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide1), for: .touchUpInside)
    }
    @objc func sginUpCheckPWHideBtn(_ sender: UIButton) {
        self.sginUpCheckPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide2), for: .touchUpInside)
    }
    /* : : : : : : : : : */
    
    private let sginUpLabel = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 50)
    }
    private let sginUpIDTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "아이디"
        $0.borderStyle = .none
        $0.backgroundColor = .clear
        $0.autocapitalizationType = .none
    }
    private let sginUpPWTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "비밀번호"
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
    }
    
    //뜬 눈
    var sginUpPWHideClickedBtn: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "eye", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .white
        return button
    }()
    /* : : : : : : : : :*/
    //뜬 눈
    var sginUpCheckPWHideClickedBtn: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "eye", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .white
        return button
    }()
    /* : : : : : : : : :*/
    
    private let checkPWTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "비밀번호 확인"
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
    }
    private let checkCodeTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "가입코드"
        $0.autocapitalizationType = .none
    }
    
    
    let idUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let pwUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let checkPWUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let checkCodeUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    
    private let sginUpButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "Main1")
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 2
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }
    
    
    
    private let goSignInLabel = UILabel().then {
        $0.text = "계정이 있으신가요?"
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    private let goSignInButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .normal)
        $0.titleLabel!.font = UIFont.systemFont(ofSize: 12)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("2")
        view.backgroundColor = .white
        addSubView()
        makeConstraints()
        self.navigationController?.navigationBar.isHidden = true;
        
        self.goSignInButton.addTarget(self, action: #selector(self.vcSwift), for: .touchUpInside)
        
        self.sginUpPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide1), for: .touchUpInside)
        self.sginUpCheckPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide2), for: .touchUpInside)
    }
    
    //비번 부분 눈 깜박깜박하는 기능
    @objc func pwHide1() {
        if pwHideCount1 == 0 {
            sginUpPWTextField.isSecureTextEntry = false;
            pwHideCount1 += 1
        } else {
            sginUpPWTextField.isSecureTextEntry = true;
            pwHideCount1 -= 1
        }
    }
    /* : : : : : : : : :*/
    
    //비번 확인 부분 눈 깜박깜박하는 기능
    @objc func pwHide2() {
        if pwHideCount2 == 0 {
            checkPWTextField.isSecureTextEntry = false;
            pwHideCount2 += 1
        } else {
            checkPWTextField.isSecureTextEntry = true;
            pwHideCount2 -= 1
        }
    }
    /* : : : : : : : : :*/
    
    @objc func vcSwift() {
        self.navigationController?.pushViewController(SginInViewController(), animated: true)
    }
    func addSubView() {
        [
            sginUpLabel,
            sginUpIDTextField,
            sginUpPWTextField,
            sginUpPWHideClickedBtn,
            checkPWTextField,
            sginUpCheckPWHideClickedBtn,
            checkCodeTextField,
            idUnderlineView,
            pwUnderlineView,
            checkPWUnderlineView,
            checkCodeUnderlineView,
            sginUpButton,
            goSignInLabel,
            goSignInButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        sginUpLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.left.equalToSuperview().inset(50)
        }
        sginUpIDTextField.snp.makeConstraints {
            $0.top.equalTo(sginUpLabel).inset(122)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        sginUpPWTextField.snp.makeConstraints {
            $0.top.equalTo(sginUpIDTextField).inset(102)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        
        sginUpPWHideClickedBtn.snp.makeConstraints {
            $0.top.equalTo(sginUpPWTextField)
            $0.left.equalTo(sginUpPWTextField).inset(320)
        }
        checkPWTextField.snp.makeConstraints {
            $0.top.equalTo(sginUpPWTextField).inset(102)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        sginUpCheckPWHideClickedBtn.snp.makeConstraints {
            $0.top.equalTo(checkPWTextField)
            $0.left.equalTo(checkPWTextField).inset(320)
        }
        checkCodeTextField.snp.makeConstraints {
            $0.top.equalTo(checkPWTextField).inset(102)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        
        idUnderlineView.snp.makeConstraints {
            $0.top.equalTo(sginUpIDTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(sginUpIDTextField).inset(-5)
        }
        pwUnderlineView.snp.makeConstraints {
            $0.top.equalTo(sginUpPWTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(sginUpPWTextField).inset(-5)
        }
        checkPWUnderlineView.snp.makeConstraints {
            $0.top.equalTo(checkPWTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(checkPWTextField).inset(-5)
        }
        checkCodeUnderlineView.snp.makeConstraints {
            $0.top.equalTo(checkCodeTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(checkCodeTextField).inset(-5)
        }
        
        sginUpButton.snp.makeConstraints {
            $0.top.equalTo(checkCodeUnderlineView).inset(78)
            $0.left.equalToSuperview().inset(85)
            $0.right.equalToSuperview().inset(85)
            $0.bottom.equalTo(goSignInLabel).inset(85)
        }
        
        goSignInLabel.snp.makeConstraints {
            $0.top.equalTo(sginUpButton).inset(7)
            $0.left.equalToSuperview().inset(130)
            $0.bottom.equalToSuperview().inset(165)
        }
        goSignInButton.snp.makeConstraints {
            $0.top.equalTo(sginUpButton).inset(4)
            $0.left.equalTo(goSignInLabel).inset(95)
            $0.bottom.equalToSuperview().inset(160)
        }
    }
}
