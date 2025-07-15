//
//  SceneDelegate 2.swift
//  To-Do_List-2
//
//  Created by Grant David Hughes on 7/15/25.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navController = UINavigationController(rootViewController: TaskListView())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
