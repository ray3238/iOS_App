//
//  TableViewCell.swift
//  TableView
//
//  Created by 이태규 on 2023/04/18.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
