//
//  AppDelegate.swift
//  To-Do_List
//
//  Created by Grant David Hughes on 7/14/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let taskListViewController = TaskListView()
        let navigationController = UINavigationController(rootViewController: taskListViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
