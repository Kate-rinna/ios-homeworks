//
//  MyUITabBarController.swift
//  Navigation
//
//  Created by Iurasova Katya on 14.05.2022.
//

import UIKit

class MyUITabBarController: UITabBarController {
    let colorSet = UIColor(hex: 0x4885CC)
    let lenta = FeedViewController()
    let profile = LogInViewController()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.tintColor = UIColor(ciColor: .init(color: colorSet))
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

// MARK: - UIColor
extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
