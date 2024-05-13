import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var toDoListTableView: UITableView!
    static var toDoListModel: [ToDoListModel] = []
    let cellIdentifier: String = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
//        toDoListTableView.estimatedSectionHeaderHeight = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        toDoListTableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewController.toDoListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell

        cell.titleLabel.text = MainViewController.toDoListModel[indexPath.row].title
        cell.contentLabel.text = MainViewController.toDoListModel[indexPath.row].content

        return cell
    }
    
    
}
