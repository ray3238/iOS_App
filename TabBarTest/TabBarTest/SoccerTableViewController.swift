//
//  ViewController.swift
//  TabBarTest
//
//  Created by 이태규 on 2023/05/16.
//

import UIKit

class SoccerTableViewController: UIViewController {

    var cellName: String = "CustomCell"
    var label: [String] = ["레반도프스키", "데이비드 베컴", "스티븐 제라드"]
    var image: [String] = ["eraser.fill","trash","paperplane.fill"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toDoList: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func toDoListTextField(_ sender: UITextField) {
        
    }
}

extension SoccerTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CustomCell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        CustomCell.label.text = label[indexPath.row]
        CustomCell.photo.image = UIImage(systemName: image[indexPath.row])
        
        
        
        
        return CustomCell
    }
}
