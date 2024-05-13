//
//  AppDelegate.swift
//  test12345678
//
//  Created by 이태규 on 4/13/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 응용 프로그램 시작 후 사용자 지정을 위해 포인트를 재정의합니다.
        // 이쪽이 데이터 구조 초기화
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // 새로운 뷰 세션이 생성될 때 호출됩니다.
        // Use this method to select a configuration to create the new scene with.
        // 이 방법을 사용하여 새 뷰를 만들 구성을 선택합니다.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // 사용자가 뷰 세션을 삭제할 때 호출됩니다.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // 응용 프로그램이 실행되지 않는 동안 세션이 삭제된 경우, 응용 프로그램 직후에 이 세션이 호출됩니다. 옵션을 사용하여 시작을 마쳤습니까.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        // 삭제된 뷰에 특정한 리소스가 반환되지 않으므로 이 방법을 사용하여 해제합니다.
    }


}

