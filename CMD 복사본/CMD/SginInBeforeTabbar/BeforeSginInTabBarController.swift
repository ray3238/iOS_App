//
//  TabbarViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/11.
//

//굳이 이쪽 뷰가 필요할까
import UIKit
import SnapKit
import Then

class BeforeSginInTabBarController: UITabBarController {
    
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
        let firstViewController = BeforeMainHomeViewController()
        firstViewController.tabBarItem = UITabBarItem(
        title: "시간표",
        image: UIImage(systemName: "house"),
        selectedImage: UIImage(systemName: "house")
        )
        
//        let secondViewController = StudentInfoViewController()
//        secondViewController.tabBarItem = UITabBarItem(
//        title: "학생정보",
//        image: UIImage(systemName: "info.circle"),
//        selectedImage: UIImage(systemName: "info.circle")
//        )
//
//        let thirdViewController = NotificationViewController()
//        thirdViewController.tabBarItem = UITabBarItem(
//        title: "공지사항",
//        image: UIImage(systemName: "bell.fill"),
//        selectedImage: UIImage(systemName: "bell.fill")
//        )
//
//        let fourViewController = SginInViewController()
//        fourViewController.tabBarItem = UITabBarItem(
//        title: "마이페이지",
//        image: UIImage(systemName: "person.crop.circle.fill"),
//        selectedImage: UIImage(systemName: "person.crop.circle.fill")
//        )
        
        viewControllers = [
            firstViewController
//            ,
//            secondViewController,
//            thirdViewController,
//            fourViewController
        ]
    }
}
