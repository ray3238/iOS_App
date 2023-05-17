//
//  InputViewController.swift
//  toDoListTest2
//
//  Created by 이태규 on 2023/05/17.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
            
            if contentTextView.text!.isEmpty || titleTextField.text!.isEmpty {
                        let titleError = UIAlertController(title: "오, 이런! 제목을 입력하지 않으셨습니다!", message: "제목을 입력해주세요!", preferredStyle: UIAlertController.Style.alert)
                        
                present(titleError, animated: false, completion: nil)
                
                let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                
                            titleError.addAction(confirm)
            } else {
                todoList.append(TodoList(title: titleTextField.text!, content: contentTextView.text!))
                self.navigationController?.popViewController(animated: true)
            }
    }
    
}
