//
//  CustomTableViewCell.swift
//  jobis
//
//  Created by 이태규 on 8/19/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let id = "CustomCell"

    private let titleLabel = UILabel().then {
        $0.text = "cell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
