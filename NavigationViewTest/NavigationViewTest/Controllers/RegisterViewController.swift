//
//  RegisterViewController.swift
//  NavigationViewTest
//
//  Created by 이태규 on 2023/05/30.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var btnForSigninViewController: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func onSigninViewControllerBtnClicked(_ sender: UIButton) {
        print("RegisterViewController-onSigninViewControllerBtnClicked() called / 로그인 버튼 클릭!")
        //네비게이션 뷰를 pop한다.
        self.navigationController?.popViewController(animated: true)
    }
    
}
