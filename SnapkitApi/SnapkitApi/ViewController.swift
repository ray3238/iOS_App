//
//  ViewController.swift
//  SnapkitApi
//
//  Created by 이태규 on 2023/07/05.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let textView = UITextView().then {
        $0.backgroundColor = .black
        $0.text = "안녕하세요"
        $0.textColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        self.view.addSubview(self.textView)
        
        textView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(300)
            $0.centerX.equalToSuperview()
        }
    }
}

