//
//  ViewController.swift
//  NavigationViewTest
//
//  Created by 이태규 on 2023/05/30.
//

import UIKit

class SigninViewController: UIViewController {

    //뷰가 생성되었을 때
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 네비게이션 바 부분을 숨김처리한다.
        self.navigationController?.isNavigationBarHidden = true
    }


}
