//
//  JoininViewController.swift
//  BucketListPost
//
//  Created by 이태규 on 2023/06/17.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBAction func signupClickedBtn(_ sender: UIButton) {
        //        Auth.auth().createUser(withEmail: idTextField.text!, password: pwTextField.text!
        //        ) { (user, error) in
        //            if user !=  nil, self.pwTextField.text == self.ConfirmPwTextField.text{
        self.ConfirmPwLabel.text = ""
        print("register success")
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "vc2") as? SignupJobViewController else {
            return
        
        self.signupBtn.addTarget(self, action: #selector(self.did), for: .touchUpInside)
        }
        
        vc.id = self.idTextField.text!
        vc.password = self.pwTextField.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //            else{
    //                self.ConfirmPwLabel.text = "비밀번호가 일치하지 않습니다"
    //                print("register failed")
    //            }
    //}
    //}
    
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var ConfirmPwTextField: UITextField!
    @IBOutlet weak var ConfirmPwLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func did() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc2") else { return
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
