//
//  TodoListPlusViewController.swift
//  TabBar
//
//  Created by 이태규 on 2023/05/22.
//

import UIKit

var todoListModel: [TodoListModel] = []

class TodoListPlusViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        
        if titleTextField.text!.isEmpty {
                    let titleError = UIAlertController(title: "오, 이런! 제목을 입력하지 않으셨습니다!", message: "제목을 입력해 주세요!", preferredStyle: UIAlertController.Style.alert)
                    
            present(titleError, animated: false, completion: nil)
            
            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            
                        titleError.addAction(confirm)
        } else if contentTextView.text!.isEmpty {
            let titleError = UIAlertController(title: "오, 이런! 내용을 입력하지 않으셨습니다!", message: "내용을 입력해 주세요!", preferredStyle: UIAlertController.Style.alert)
            
    present(titleError, animated: false, completion: nil)
    
    let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
    
                titleError.addAction(confirm)
        }else {
            todoListModel.append(TodoListModel(titleLabel: titleTextField.text!, contentLabel: contentTextView.text!))
            self.navigationController?.popViewController(animated: true)
        }
    }
}
