//
//  CustomCell.swift
//  TableView2
//
//  Created by 이태규 on 2023/05/02.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
