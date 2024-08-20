//
//  NavigateViewController.swift
//  jobis
//
//  Created by 이태규 on 8/19/24.
//

import UIKit

class NavigateViewController: UIViewController {
    private let titleLabel = UILabel().then {
        $0.text = "Navigate 뷰"
        $0.textColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
