//
//  TodoListViewController.swift
//  TabBar
//
//  Created by 이태규 on 2023/05/22.
//

import UIKit

class TodoListViewController: UIViewController {
    
    let todoListCellName: String = "todoListCell"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoListCell = tableView.dequeueReusableCell(withIdentifier: todoListCellName, for: indexPath) as! todoListCell
        
        todoListCell.titleLabel.text = todoListModel[indexPath.row].titleLabel
        todoListCell.contentLabel.text = todoListModel[indexPath.row].contentLabel
        
        return todoListCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoListModel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

