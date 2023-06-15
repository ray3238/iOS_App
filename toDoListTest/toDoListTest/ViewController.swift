//
//  ViewController.swift
//  toDoListTest
//
//  Created by 이태규 on 2023/05/17.
//

import UIKit

class ViewController: UIViewController {

    var cellName: String = "CustomCell"
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CustomCell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        
        
        return CustomCell
    }
    
    
}
