//
//  SubjectTableViewControllerCell.swift
//  CMD
//
//  Created by 이태규 on 2023/07/11.
//

import Foundation
import UIKit
import SnapKit
import Then

class SubjectTableViewControllerCell: UITableViewCell {
    
    let whiteBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }
    let numClass = UILabel().then {
        $0.textColor = .black
        $0.text = "1교시"
    }
    let subject = UILabel().then {
        $0.textColor = .black
        $0.text = "지니"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("5")
        backgroundColor = UIColor(named: "Main1")
        contentView()
        makeConstraints()
    }
    
    func contentView() {
        [
            whiteBtn,
            numClass,
            subject
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    func makeConstraints() {
        whiteBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.left.equalToSuperview().inset(1)
            $0.right.equalToSuperview().inset(1)
            $0.bottom.equalToSuperview().inset(11)
        }
        numClass.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.left.equalToSuperview().inset(27)
            $0.bottom.equalToSuperview().inset(22)
        }
        subject.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
