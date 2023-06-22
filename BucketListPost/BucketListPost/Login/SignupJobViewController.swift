//
//  JoininJobViewController.swift
//  BucketListPost
//
//  Created by 이태규 on 2023/06/17.
//

import UIKit

class SignupJobViewController: UIViewController {
    
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signupJobLabel: UILabel!
    @IBOutlet weak var signupJobTextField: UITextField!
    var id: String = ""
    var password: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if signupJobTextField.text?.isEmpty ?? true {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "vc3") as? WhyBucketListViewController else {
                        return
                    }
            print(id)
            print(password)
            print(signupJobLabel.text!)
            vc.id = self.id
            vc.password = self.password
            vc.job = self.signupJobTextField.text!
            self.signupBtn.addTarget(self, action: #selector(self.did), for: .touchUpInside)
        }
        else {
            signupJobLabel.text = "필수 입력칸입니다"
            signupJobLabel.textColor = .red
        }
    }
    @objc func did() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc3") else { return
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
