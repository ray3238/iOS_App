//
//  ViewController.swift
//  TableView3
//
//  Created by 이태규 on 2023/05/06.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CustomCell = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell, for: indexPath) as! CustomCell
        return cell
    }
}
