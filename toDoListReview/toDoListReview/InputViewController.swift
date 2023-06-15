//
//  ViewController.swift
//  TodoListReview
//
//  Created by 이태규 on 2023/05/18.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var contentText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        if titleText.text!.isEmpty {
            let titleError = UIAlertController(title: "오, 이런! 제목을 입력하지 않으셨습니다!", message: "제목을 입력해 주세요!", preferredStyle: UIAlertController.Style.alert)
            
            present(titleError, animated: false, completion: nil)
            
            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            
            titleError.addAction(confirm)
        } else if  contentText.text!.isEmpty {
            let titleError = UIAlertController(title: "오, 이런! 내용을 입력하지 않으셨습니다!", message: "내용을 입력해 주세요!", preferredStyle: UIAlertController.Style.alert)
            
            present(titleError, animated: false, completion: nil)
            
            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            
                titleError.addAction(confirm)
            
        } else {
            todoList.append(TodoList(title: titleText.text!, content: contentText.text!))
            self.navigationController?.popViewController(animated: true)
        }
    }
}
