//
//  ViewController.swift
//  SnapkitPractice
//
//  Created by 이태규 on 2023/07/05.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let textField = UITextField().then {
        $0.placeholder = "제목을 입력해주세요"
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        
    }
    
    let button = UIButton().then {
        $0.setTitle("대상자", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    let textViewdd = UITextView().then {
        $0.text = "안녕하세요 반갑습니다."
        $0.textColor = .lightGray
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textContainerInset = UIEdgeInsets(top: 14, left: 15, bottom: 0, right: 5)
    }
    
    let button2 = UIButton().then {
        $0.setTitle("게시하기", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textViewdd.delegate = self
        
        addSubView()
        makeConstraints()
        view.backgroundColor = .white
    }
    
    func addSubView() {
        [
            textField,
            button,
            textViewdd,
            button2
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(105)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(textField).inset(42)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(308)
        }
        
        textViewdd.snp.makeConstraints {
            $0.top.equalTo(button).inset(44)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(button2).inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        
        button2.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(765)
            $0.left.equalToSuperview().inset(34)
            $0.right.equalToSuperview().inset(34)
            $0.bottom.equalToSuperview().inset(126)
        }
    }
}




extension ViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textViewdd.text.isEmpty {
            textViewdd.text = "안녕하세요 반갑습니다."
            textViewdd.textColor = UIColor.lightGray
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textViewdd.textColor == UIColor.lightGray {
            textViewdd.text = nil
            textViewdd.textColor = UIColor.black
        }
    }
}

