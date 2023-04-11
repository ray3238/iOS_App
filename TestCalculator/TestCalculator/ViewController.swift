//
//  ViewController.swift
//  TestCalculator
//
//  Created by 이태규 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Value: UILabel!
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var buho: UILabel!
    @IBOutlet weak var errorMe: UILabel!
    @IBOutlet weak var denho: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        self.Value.textColor = .white
        self.buho.textColor = .white
        self.errorMe.textColor = .white
        self.denho.textColor = .white
        self.errorMe.font = .systemFont(ofSize: 40)
    }

    func errorFunc(){
        Value.text = "0"
        errorMe.text = "!ERROR!"
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.errorMe.text = "계산기"
        }
    }
    
    @IBAction func PlusButton(_ sender: Any) {
        buho.text = "+"
        if let x = Int(num1.text!), let y = Int(num2.text!) {
            Value.text = String(x + y)
        } else {
            errorFunc()
        }
    }
    @IBAction func MinusButton(_ sender: Any) {
        buho.text = "-"
        if let x = Int(num1.text!), let y = Int(num2.text!) {
            Value.text = String(x - y)
        } else {
            errorFunc()
        }
    }
    @IBAction func gob(_ sender: Any) {
        buho.text = "*"
        if let x = Int(num1.text!), let y = Int(num2.text!) {
            Value.text = String(x * y)
        } else {
            errorFunc()
        }
    }
    @IBAction func div(_ sender: Any) {
        buho.text = "/"
        if let x = Float(num1.text!), let y = Float(num2.text!) {
            Value.text = String(x / y)
        } else {
            errorFunc()
        }
    }
}

