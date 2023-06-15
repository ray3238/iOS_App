//
//  ViewController.swift
//  Test
//
//  Created by 이태규 on 2023/06/12.
//

import UIKit

class ViewController: UIViewController {

    let cellID: String = "CustomCell"
    let name: [String] = ["Lewandowski", "Gerrard", "Beckham"]
    let club: [String] = ["München", "Liverpool", "Manchester"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CustomCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
        
        CustomCell.titleLabel.text = name[indexPath.row]
        CustomCell.titleLabel.text = club[indexPath.row]
        
        return CustomCell
    }
    
    
}
