//
//  ViewController.swift
//  SnapKitNavigationView
//
//  Created by 이태규 on 2023/06/13.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

//    let navigationView = UIView() // 네비게이션 뷰
    let button = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(did), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

    @objc func did() {
        self.navigationController?.pushViewController(NViewController(), animated: true)
    }
}

