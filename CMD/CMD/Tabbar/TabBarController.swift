//
//  TabbarViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/11.
//

//로그인하면 탭바로 와야할지
//아니면 메인 화면으로 가야할지

import UIKit
import SnapKit
import Then

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3")
        setupTabbarLayout()
        setupTabbarItem()
    }
    
    func setupTabbarLayout() {
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
    }
    
    func setupTabbarItem() {
        let firstViewController = MainHomeViewController()
        firstViewController.tabBarItem = UITabBarItem(
        title: "안녕",
        image: UIImage(systemName: "eye"),
        selectedImage: UIImage(systemName: "eye.slash")
        )
        
        let secondViewController = StudentInfoViewController()
        secondViewController.tabBarItem = UITabBarItem(
        title: "잘가",
        image: UIImage(systemName: "house"),
        selectedImage: UIImage(systemName: "house")
        )
        
        let thirdViewController = NotificationViewController()
        thirdViewController.tabBarItem = UITabBarItem(
        title: "잘가",
        image: UIImage(systemName: "square.and.arrow.down"),
        selectedImage: UIImage(systemName: "square.and.arrow.down.fill")
        )
        
        let fourViewController = SginInViewController()
        fourViewController.tabBarItem = UITabBarItem(
        title: "하윙",
        image: UIImage(systemName: "trash"),
        selectedImage: UIImage(systemName: "trash.fill")
        )
        
        viewControllers = [
            firstViewController,
            secondViewController,
            thirdViewController,
            fourViewController
        ]
    }
}
