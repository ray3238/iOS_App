import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func toDoListButtonDidTap(_ sender: Any) {
        MainViewController.toDoListModel.append(
            ToDoListModel(
                title: titleTextField.text ?? "",
                content: contentTextView.text ?? ""
            )
        )
        self.navigationController?.popViewController(animated: true)
    }
}
