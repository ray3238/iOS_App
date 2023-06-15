//
//  Trash.swift
//  TabBarTest
//
//  Created by 이태규 on 2023/05/17.
//

import UIKit


class TodoList: UIViewController {
    var todoListCell: String = "TodoListCell"
    
    
    @IBOutlet weak var todoListContent: UILabel!
    @IBOutlet weak var todoListTitle: UILabel!
    @IBOutlet weak var todoListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoListTableView.dataSource = self
        todoListTableView.delegate = self
    }

    
    
    
}


extension TodoList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoListCell = tableView.dequeueReusableCell(withIdentifier: TodoListCell, for: indexPath) as! TodoListCell
        
        todoListCell.todoListLabel.text = todoListTitle[indexPath.row]

        return todoListCell
    }
    

    
}
