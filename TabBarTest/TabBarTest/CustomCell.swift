//
//  CustomCell.swift
//  TabBarTest
//
//  Created by 이태규 on 2023/05/16.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var button: UIButton!
}

class TodoListCell: UITableViewCell {
    @IBOutlet weak var todoListLabel: UILabel!
    @IBOutlet weak var todoListButton: UIButton!
}
