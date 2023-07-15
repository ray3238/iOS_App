//
//  SceneDelegate.swift
//  CMD
//
//  Created by 이태규 on 2023/07/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //        do {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = TabBarController()
        let navigationController = UINavigationController(rootViewController: TabBarController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        //
        //        }
        //        guard let _ = (scene as? UIWindowScene) else { return }
        //    }
    }
    
}


//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//
//        guard let scene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: scene)
//
//        let firstViewController = MainHomeViewController()
//        let secondViewController = UINavigationController(rootViewController: StudentInfoViewController())
//        let thirdViewController = UINavigationController(rootViewController: NotificationViewController())
//
//        let tabBarViewController = UITabBarController()
//        tabBarViewController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)
//
//        if let items = tabBarViewController.tabBar.items {
//            items[0].selectedImage = UIImage(systemName: "house")
//            items[0].image = UIImage(systemName: "house")
//            items[0].title = "시간표"
//
//            items[1].selectedImage = UIImage(systemName: "eye")
//            items[1].image = UIImage(systemName: "eye")
//            items[1].title = "시간표"
//
//            items[2].selectedImage = UIImage(systemName: "eye")
//            items[2].image = UIImage(systemName: "eye")
//            items[2].title = "시간표"
//        }
////
//        window?.rootViewController? = MainHomeViewController()
//        window?.makeKeyAndVisible()
//
//    }
//}

func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    
    // Save changes in the application's managed object context when the application transitions to the background.
    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
}

