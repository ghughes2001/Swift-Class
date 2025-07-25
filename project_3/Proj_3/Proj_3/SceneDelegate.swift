//
//  SceneDelegate.swift
//  Proj_3
//
//  Created by Grant David Hughes on 7/21/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        print("SceneDelegate reached")

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let rootVC = PokemonViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
