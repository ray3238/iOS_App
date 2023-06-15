//
//  NViewController.swift
//  MyTestApp
//
//  Created by 이태규 on 2023/06/14.
//

import UIKit
import Then
import SnapKit

class NViewController: UIViewController {
    
    let alabel = UILabel().then {
        $0.text = "로그인 성공"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(alabel)
        
        alabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
