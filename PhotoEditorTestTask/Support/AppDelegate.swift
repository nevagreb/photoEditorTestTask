//
//  AppDelegate.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 21.08.2025.
//


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // for iOS 12

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if #available(iOS 13.0, *) {
            // window is created in SceneDelegate
        } else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
            self.window = window
        }
        return true
    }

    // MARK: - for iOS 13+

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration",
                                    sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

