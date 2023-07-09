//
//  ViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/09.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 50)
    }
    let loginIDTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "아이디를 입력해주세요"
    }
//    let loginPWTextField = UITextField().then {
//        $0.textColor = .black
//        $0.placeholder = "비밀번호를 입력해주세요"
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubView()
        makeConstraints()
    }
    
    func addSubView() {
        [
            loginLabel,
            loginIDTextField
//            ,loginPWTextField
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
            $0.top.equalTo(loginLabel).inset(220)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
//        loginPWTextField.snp.makeConstraints {
//            $0.top.equalTo(loginIDTextField).inset(80)
//            $0.left.equalToSuperview().inset(40)
//            $0.right.equalToSuperview().inset(30)
//        }
    }
}

