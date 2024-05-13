import UIKit

class InputToDoListViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func toDoListButtonDidTap(_ sender: UIButton) {
        if titleTextField.text!.isEmpty {
            let titleError = UIAlertController(title: "오, 이런! 제목을 입력하지 않으셨습니다!", message: "제목을 입력해 주세요!", preferredStyle: UIAlertController.Style.alert)

            present(titleError, animated: false, completion: nil)

            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)

            titleError.addAction(confirm)
        } else if  contentTextView.text!.isEmpty {
            let titleError = UIAlertController(title: "오, 이런! 내용을 입력하지 않으셨습니다!", message: "내용을 입력해 주세요!", preferredStyle: UIAlertController.Style.alert)

            present(titleError, animated: false, completion: nil)

            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)

            titleError.addAction(confirm)
        } else {
            MainViewController.toDoListModel.append(
                ToDoListModel(
                    title: titleTextField.text!,
                    content: contentTextView.text!
                )
            )
            self.navigationController?.popViewController(animated: true)
        }
    }
}
