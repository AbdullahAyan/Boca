//
//  AppDelegate.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import UIKit
import SnapKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        setupWindow()
        return true
    }

    
    private func setupWindow() {
        let window = UIWindow()
        let viewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }


}

