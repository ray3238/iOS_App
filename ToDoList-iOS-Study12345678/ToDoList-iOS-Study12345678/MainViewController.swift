import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var toDoListTableView: UITableView!
    static var toDoListModel: [ToDoListModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
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

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            MainViewController.toDoListModel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
