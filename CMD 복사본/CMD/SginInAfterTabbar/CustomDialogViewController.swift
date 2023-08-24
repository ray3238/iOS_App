//
//  CustomDialogViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/16.
//

// dialog pop up창 띄울 예정
//안될것 같으면 그냥 네비게이션이나 modal 처리.
import UIKit
import SnapKit
import Then

class CustomDialogViewController: UIViewController {
    
    let button = UIButton().then {
        $0.setTitle("X", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.right.equalToSuperview().inset(10)
        }
        
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc func dismissView(){
        dismiss(animated: false, completion: nil)
    }
    
}
