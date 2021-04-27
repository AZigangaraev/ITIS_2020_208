//
//  SceneDelegate.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)
        let coordinator = CouncilFlowCoordinator(navigationController: UINavigationController(), factory: ServiceFactorySecondImplementation())
        let viewController = coordinator.startViewController()
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

