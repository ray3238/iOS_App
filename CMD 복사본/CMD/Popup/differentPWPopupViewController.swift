//
//  differentPWPopupViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/08/07.
//

import UIKit
import SnapKit
import Then

class differentPWPopupViewController: UIViewController {

    let containerView = UIView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 10.0
    }
    
    let contentView = UIView().then {
        $0.backgroundColor = UIColor.systemGray5
        $0.layer.cornerRadius = 2
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }
    
    let errorLabel = UILabel().then {
        $0.text = "비밀번호가 일치하지 않습니다"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containerView)
        containerView.addSubview(contentView)
        contentView.addSubview(errorLabel)
        setupPopupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupPopupView() {
        // SnapKit을 사용하여 레이아웃 설정
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(210)
            make.height.equalTo(70)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        errorLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        // 팝업창 외부를 탭했을 때 닫기
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closePopup))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func closePopup() {
        dismiss(animated: true, completion: nil)
    }
    

}
