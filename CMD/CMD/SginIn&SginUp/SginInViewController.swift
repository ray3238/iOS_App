//
//  ViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/09.
//

import UIKit
import SnapKit
import Then

class SginInViewController: UIViewController {
    var pwHideCount = 0
    
    @objc func loginBtn(_ sender: UIButton) {
        self.loginClickedBtn.addTarget(self, action: #selector(self.MainVCSwift), for: .touchUpInside)
    }
    @objc func goSginUpBtn(_ sender: UIButton) {
        self.goSignUpClickedBtn.addTarget(self, action: #selector(self.sginUpVCSwift), for: .touchUpInside)
    }
    @objc func loginPWHideBtn(_ sender: UIButton) {
        self.loginPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide), for: .touchUpInside)
    }
    
    private let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 50)
    }
    private let loginIDTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "아이디"
        $0.borderStyle = .none
        $0.backgroundColor = .clear
        $0.autocapitalizationType = .none
    }
    let IDUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let PWUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    private let loginPWTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
        $0.autocapitalizationType = .none
    }
    
    //eye
    var loginPWHideClickedBtn: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "eye", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .white
        return button
    }()
    
    
    private let loginClickedBtn = UIButton().then {
        $0.backgroundColor = UIColor(named: "Main1")
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 2
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }
    private let goSignUpLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    private let goSignUpClickedBtn = UIButton().then {
        $0.setTitle("회원가입하기", for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .normal)
        $0.titleLabel!.font = UIFont.systemFont(ofSize: 12)
    }
    private let findPWLabel = UILabel().then {
        $0.text = "비밀번호를 까먹으셨나요?"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    private let findPWBtn = UIButton().then {
        $0.setTitle("비밀번호찾기", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel!.font = UIFont.systemFont(ofSize: 12)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubView()
        makeConstraints()
        self.navigationController?.navigationBar.isHidden = true;
        self.goSignUpClickedBtn.addTarget(self, action: #selector(self.sginUpVCSwift), for: .touchUpInside)
        self.loginPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide), for: .touchUpInside)
        self.loginClickedBtn.addTarget(self, action: #selector(self.MainVCSwift), for: .touchUpInside)
    }
    
    @objc func MainVCSwift() {
        self.navigationController?.pushViewController(MainHomeViewController(), animated: true)
        //여기에 로그인 API
    }
    
    @objc func sginUpVCSwift() {
        self.navigationController?.pushViewController(SginUpViewController(), animated: true)
    }
    
    @objc func pwHide() {
        if pwHideCount == 0 {
            loginPWTextField.isSecureTextEntry = false;
            pwHideCount += 1
        } else {
            loginPWTextField.isSecureTextEntry = true;
            pwHideCount -= 1
        }
    }
    
    func addSubView() {
        [
            loginLabel,
            loginIDTextField,
            loginPWTextField,
            loginPWHideClickedBtn,
            IDUnderlineView,
            PWUnderlineView,
            loginClickedBtn,
            goSignUpLabel,
            goSignUpClickedBtn,
            findPWLabel,
            findPWBtn
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        loginLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.left.equalToSuperview().inset(50)
        }
        loginIDTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel).inset(200)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        loginPWTextField.snp.makeConstraints {
            $0.top.equalTo(loginIDTextField).inset(80)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        loginPWHideClickedBtn.snp.makeConstraints {
            $0.top.equalTo(loginPWTextField)
            $0.left.equalTo(loginPWTextField).inset(320)
        }
        /*TextField 밑줄*/
        IDUnderlineView.snp.makeConstraints {
            $0.top.equalTo(loginIDTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(loginIDTextField).inset(-5)
        }
        PWUnderlineView.snp.makeConstraints {
            $0.top.equalTo(loginPWTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(loginPWTextField).inset(-5)
        }
        /* : : : : : : */
        loginClickedBtn.snp.makeConstraints {
            $0.top.equalTo(PWUnderlineView).inset(200)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(35)
            $0.bottom.equalTo(goSignUpLabel).inset(32)
        }
        goSignUpLabel.snp.makeConstraints {
            $0.top.equalTo(loginClickedBtn).inset(64)
            $0.left.equalToSuperview().inset(132)
            $0.bottom.equalToSuperview().inset(240)
        }
        goSignUpClickedBtn.snp.makeConstraints {
            $0.top.equalTo(loginClickedBtn).inset(58)
            $0.left.equalTo(goSignUpLabel).inset(95)
            $0.bottom.equalToSuperview().inset(233)
        }
        findPWLabel.snp.makeConstraints {
            $0.top.equalTo(goSignUpLabel).inset(22)
            $0.left.equalToSuperview().inset(101)
        }
        findPWBtn.snp.makeConstraints {
            $0.top.equalTo(goSignUpLabel).inset(16)
            $0.left.equalTo(findPWLabel).inset(126)
        }
    }
}
