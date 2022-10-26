//
//  AppDelegate.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import UIKit
import SnapKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices

      
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        FirebaseApp.configure()

        setupWindow()
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }

    
    private func setupWindow() {
        let window = UIWindow()
        
        let menuViewController = MenuViewController()
        let basketViewController = BasketViewController()
        let profileViewController = ProfileViewController()
        
        menuViewController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "menucard"), tag: 0)
        basketViewController.tabBarItem = UITabBarItem(title: "Sepet", image: UIImage(systemName: "basket"),tag: 1)
        profileViewController.tabBarItem = UITabBarItem(title: "Profil", image: UIImage(systemName: "person.crop.circle"),tag: 2)
        
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        let basketNavigationController = UINavigationController(rootViewController: basketViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [menuNavigationController,basketNavigationController,profileNavigationController]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    


}
