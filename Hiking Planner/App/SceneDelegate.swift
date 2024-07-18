//
//  SceneDelegate.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.06.24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = MainTabBarController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}


