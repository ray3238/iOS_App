//
//  SigninViewController.swift
//  TabBar
//
//  Created by 이태규 on 2023/05/25.
//

import UIKit
import Alamofire

class SigninViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signinButtonClicked(_ sender: UIButton) {
        signin()
    }
    
    func signin() {
        let url = "https://api-dev.aliens-dms.com/auth/tokens"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        let parms = [
            "account_id": emailTextField.text,
            "password": passwordTextField.text
        ]
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: parms, options: [])
        } catch {
            print("http body error")
        }
        
        AF.request(request).responseString { result in
            switch result.result {
            case .success(_):
                guard let statusCode = result.response?.statusCode else {return}
                switch statusCode {
                case 200...300:
                    guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondSigninViewController") as? SecondSigninViewController else { return }
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    print("Sign in")
                default:
                    print("다시 시도해주세요")
                    print("statusCode:", statusCode)
                }
            case .failure(let error):
                print("error:", error)
            }
        }
    }
}
