//
//  SceneDelegate.swift
//  Alias
//
//  Created by Dyadichev on 27.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            window = UIWindow(windowScene: windowScene)
            // Указываем файл с которого будет осуществляться загрузка, в нашем случае ViewController.
            window?.rootViewController = UINavigationController(rootViewController: MainViewController())
            // Нам нужно отобразить его поэтому вызываем это свойство.
            window?.makeKeyAndVisible()
    }


}

