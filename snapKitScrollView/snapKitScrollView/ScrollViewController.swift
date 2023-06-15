//
//  ViewController.swift
//  snapKitScrollView
//
//  Created by 이태규 on 2023/06/12.
//

import UIKit
import SnapKit
import Then

class ScrollViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let label1 = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요1"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let label2 = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요2"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let label3 = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요3"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let label4 = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요4"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let label5 = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요5"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let label6 = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요6"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        [label1, label2, label3, label4, label5, label6].forEach {
            self.contentView.addSubview($0)
        }
        makeConstraints()
    }

    func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(1200)
        }
        label1.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
        }
        label2.snp.makeConstraints {
            $0.top.equalTo(label1).inset(200)
            $0.centerX.equalToSuperview()
        }
        label3.snp.makeConstraints {
            $0.top.equalTo(label2).inset(200)
            $0.centerX.equalToSuperview()
        }
        label4.snp.makeConstraints {
            $0.top.equalTo(label3).inset(200)
            $0.centerX.equalToSuperview()
        }
        label5.snp.makeConstraints {
            $0.top.equalTo(label4).inset(200)
            $0.centerX.equalToSuperview()
        }
        label6.snp.makeConstraints {
            $0.top.equalTo(label5).inset(200)
            $0.centerX.equalToSuperview()
        }
    }

}

