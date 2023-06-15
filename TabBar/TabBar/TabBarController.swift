//
//  ViewController.swift
//  TabBar
//
//  Created by 이태규 on 2023/05/22.
//

import UIKit
import Lottie

class TabBarController: UITabBarController {

    let titleLabel: UILabel =   {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    let animationView: LottieAnimationView = {
         
        let animView = LottieAnimationView(name: "143676-grow")
        animView.frame = CGRect(x:0,y:0,width: 400, height: 400)
        
        animView.contentMode = .scaleAspectFill
        
        return animView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(animationView)
        
        animationView.center = view.center
        
        
        // 애니매이션 실행
        animationView.play{ (finish) in
            print("애니매이션이 끝났다.")
            
            self.animationView.removeFromSuperview()
            
            self.view.backgroundColor = .white
            
            self.view.addSubview(self.titleLabel)
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
        }
    }
}

