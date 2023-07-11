//
//  ViewController.swift
//  TodoListReview
//
//  Created by 이태규 on 2023/05/18.
//

var todoList: [TodoList] = []

import UIKit

class ViewController: UIViewController {

    var cellName: String = "CustomCell"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedSectionHeaderHeight = 0
        print("안녕")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CustomCell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        CustomCell.titleViewLabel.text = todoList[indexPath.row].title
        CustomCell.contentViewLabel.text = todoList[indexPath.row].content
        
        return CustomCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                todoList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    
    
}
