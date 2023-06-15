//
//  ViewControllerCell.swift
//  snapKitTableView
//
//  Created by 이태규 on 2023/06/12.
//

import UIKit
import SnapKit
import Then

class ViewControllerCell: UITableViewCell {
    
    let identifier = "ViewControllerCell"
    
    let label = UILabel().then {
        $0.text = "안녕"
        $0.textColor = .black
    }
    let button = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView()
        makeConstraints()
    }
    
    func contentView() {
        contentView.addSubview(button)
        contentView.addSubview(label)
    }
    
    func makeConstraints() {
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label).inset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
