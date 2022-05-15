//
//  MyUITabBarController.swift
//  Navigation
//
//  Created by Iurasova Katya on 14.05.2022.
//

import UIKit

class MyUITabBarController: UITabBarController {
  
    let lenta = FeedViewController()
    let profile = ProfileViewController()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        let lentaController = UINavigationController(rootViewController: lenta)
        lenta.tabBarItem.title = "Лента"
        lenta.tabBarItem.image = UIImage(systemName: "note")
        lenta.navigationItem.title = "Лента"
        
        let profileController = UINavigationController(rootViewController: profile)
        profile.tabBarItem.title = "Профиль"
        profile.tabBarItem.image = UIImage(systemName: "hare")
        profile.navigationItem.title = "Профиль"
        
     
        viewControllers = [lentaController, profileController]
    }

}
