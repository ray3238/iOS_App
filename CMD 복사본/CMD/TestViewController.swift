//
//  TestViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/17.
//

import UIKit
import SnapKit
import Then

class TestViewController: UIViewController {
    static let identifier = "TestViewController"
    let label = UILabel().then {
        $0.textColor = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
