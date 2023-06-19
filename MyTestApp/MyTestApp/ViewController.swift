//
//  ViewController.swift
//  Everytime
//
//  Created by 이태규 on 2023/06/08.
//

import UIKit
import SnapKit
import Then
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @objc func btnActSubmit(_ sender: UIButton) {
        guard let userEmailet = idTextField.text else { return }
        guard let userPassword = pwTextField.text else  { return }
        Auth.auth().signIn(withEmail: userEmailet, password: userPassword) {
            [weak self] user, error in
            guard let _ = self else { return }
            let user = Auth.auth().currentUser
            
            if  user?.email == userEmailet,
                user?.uid == userPassword {
                print("push!")
                self!.signinButton.addTarget(self, action: #selector(self!.did), for: .touchUpInside)
            } else {
                print("로그인되지 않았습니다.", error?.localizedDescription ?? "")
            }
        }
    }
    
    private let smallTitleLabel = UILabel().then {
        $0.text = "대학생활을 더 편하고 즐겁게"
        $0.textColor = .gray
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "에브리타임"
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textColor = .red
    }
    
    let idTextField = UITextField().then {
        $0.backgroundColor = .systemGray5
        $0.placeholder = "아이디"
        $0.layer.cornerRadius = 30
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    
    let pwTextField = UITextField().then {
        $0.backgroundColor = .systemGray5
        $0.placeholder = "비밀번호"
        $0.layer.cornerRadius = 30
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y:0.0, width:16.0, height: 0.0))
        $0.rightViewMode = .always
    }
    
    let signinButton = UIButton().then {
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 30
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("에브리타임 로그인", for: .normal)
        $0.titleLabel!.font = UIFont.systemFont(ofSize: 20)
    }
    
    let whyIdPwButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitleColor(UIColor.systemGray2, for: .normal)
        $0.setTitle("아이디/비밀번호 찾기", for: .normal)
    }
    
    let joininButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubview()
        makeConstraints()
        view.backgroundColor = .white
        signinButton.addTarget(self, action: #selector(btnActSubmit), for: .touchUpInside)
    }
    
    @objc func did() {
        print("push!")
        self.navigationController?.pushViewController(NViewController(), animated: true)
    }
    
    func addSubview() {
        [
            smallTitleLabel,
            titleLabel,
            idTextField,
            pwTextField,
            signinButton,
            whyIdPwButton,
            joininButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        smallTitleLabel.snp.remakeConstraints {
            $0.top.equalToSuperview().inset(300)
            $0.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(smallTitleLabel).inset(25)
            $0.centerX.equalToSuperview()
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel).inset(80)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(20)
            $0.height.equalTo(65)
            $0.centerX.equalToSuperview()
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField).inset(70)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(20)
            $0.height.equalTo(65)
            $0.centerX.equalToSuperview()
        }
        signinButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField).inset(75)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(20)
            $0.height.equalTo(65)
            $0.centerX.equalToSuperview()
        }
        whyIdPwButton.snp.makeConstraints {
            $0.top.equalTo(signinButton).inset(110)
            $0.right.equalToSuperview().inset(120)
            $0.left.equalToSuperview().inset(120)
        }
        joininButton.snp.makeConstraints {
            $0.top.equalTo(whyIdPwButton).inset(40)
            $0.right.equalToSuperview().inset(120)
            $0.left.equalToSuperview().inset(120)
        }
    }
}

