//
//  ViewController.swift
//  TableView2
//
//  Created by 이태규 on 2023/05/02.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var table: UITableView!
    let cellName: String = "CustomCell"
    let cellTitle: [String] = ["하우스", "게임", "플스"]
    let cellImage: [String] = ["house", "gamecontroller", "playstation.logo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(systemName: "xbox.logo")
        table.dataSource = self
        table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = table.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        customCell.photo.image = UIImage(systemName: cellImage[indexPath.row])
        customCell.label.text = cellTitle[indexPath.row]
        
        return customCell
    }
}

