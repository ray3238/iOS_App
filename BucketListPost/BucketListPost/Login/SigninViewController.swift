//
//  SigninViewController.swift
//  BucketListPost
//
//  Created by 이태규 on 2023/06/17.
//

import UIKit
import Firebase
import FirebaseAuth

class SigninViewController: UIViewController {
    
    @IBAction func signinClickedBtn(_ sender: UIButton) {
//        Auth.auth().signIn(withEmail: idTextField.text!, password: pwTextField.text!) { (user, error) in
            
//            if user != nil {
//                print("push!")
                self.signinBtn.addTarget(self, action: #selector(self.did), for: .touchUpInside)
//            }
            
//            else {
//                print("로그인되지 않았습니다.", error?.localizedDescription ?? "")
//            }
//        }
    }
        
    
    // MARK: 경계선
    
    
        @IBAction func signinCleckedBtn(_ sender: UIButton) {
            guard let userEmail = idTextField.text else { return }
            guard let userPassword = pwTextField.text else  { return }
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) {
            [weak self] user, error in
            guard let _ = self else { return }
            let user = Auth.auth().currentUser

            if let userEmail = user?.email,
               let userUid = user?.uid {
                print("push!")
                self!.signinBtn.addTarget(self, action: #selector(self!.did), for: .touchUpInside)
            } else {
                print("로그인되지 않았습니다.", error?.localizedDescription ?? "")
            }
        }
    }
    
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func did() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc1") else { return
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
