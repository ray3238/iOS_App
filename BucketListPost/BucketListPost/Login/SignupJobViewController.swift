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
    var sqidData2: String = ""
    var sqpwData2: String = ""
    var spidData1 : String = ""
    var sppwData1 : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if signupJobTextField.text?.isEmpty ?? true {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "vc3") as? WhyBucketListViewController else {
                        return
                    }

            vc.spidData3 = self.sqidData2
            vc.sppwData3 = self.sqpwData2
            vc.spjobData3 = self.signupJobTextField.text!
            self.signupBtn.addTarget(self, action: #selector(self.did), for: .touchUpInside)
        }
        else {
            signupJobLabel.text = "필수 입력칸입니다"
            signupJobLabel.textColor = .red
        }
        
        self.sqidData2 = spidData1
        print(spidData1)
        self.sqpwData2 = sppwData1
        print(sppwData1)
    }
    @objc func did() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc3") else { return
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
