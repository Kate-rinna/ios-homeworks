//
//  AppDelegate.swift
//  Navigation
//
//  Created by Iurasova Katya on 14.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? //Создаем окно, в котором будем работать

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MyUITabBarController()
        window?.makeKeyAndVisible()
        return true
    }
}

