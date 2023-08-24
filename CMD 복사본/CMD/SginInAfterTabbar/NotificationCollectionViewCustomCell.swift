//
//  NotificationCollectionViewCustomCell.swift
//  CMD
//
//  Created by 이태규 on 2023/07/17.
//

import SnapKit
import Then


class NotificationCollectionViewCustomCell: UICollectionViewCell {
    static let identifier = "NotificationCollectionViewCustomCell"
    
    let notiFicationTitleLabel = UILabel().then {
        $0.text = "공지사항 제목"
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }
    let notiFicationDateLabel = UILabel().then {
        $0.text = "2023.07.17 오전 12:57"
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("7")
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.shadowOffset = CGSize.zero
        contentView.layer.shadowRadius = 2
        addSubView()
        setLayout()
    }
    
    func addSubView() {
        [
            notiFicationTitleLabel,
            notiFicationDateLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        notiFicationTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.left.equalToSuperview().inset(12)
        }
        notiFicationDateLabel.snp.makeConstraints {
            $0.top.equalTo(notiFicationTitleLabel).inset(33)
            $0.left.equalToSuperview().inset(12)
        }
    }
    
//    func configure(with notification: NotificationModel) {
//        notiFicationTitleLabel.text = notification.title
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
