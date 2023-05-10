//
//  ViewController.swift
//  TableView6
//
//  Created by 이태규 on 2023/05/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellName: String = "CustomCell"
    let cellLabel: [String] = ["첫 번째", "두 번째", "세 번째"]
    let cellImage: [String] = ["folder", "paperplane.fill", "book.circle.fill"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CustomCell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        CustomCell.label.text = cellLabel[indexPath.row]
        CustomCell.photo.image = UIImage(systemName: cellImage[indexPath.row])
        
        return CustomCell
    }

}

