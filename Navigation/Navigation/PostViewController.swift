//
//  PostViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 14.05.2022.
//

import UIKit

struct Post {
    var title = "Пост"
}

class PostViewController: UIViewController {
    
    var postTitle: String = "Публикация"
       
       override func viewDidLoad() {
           super.viewDidLoad()
           self.navigationItem.title = postTitle
           view.backgroundColor = .white
           makeBarItem()
       }
       
       func makeBarItem(){
           let rightBarItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(buttonAction))
               self.navigationItem.title = postTitle
               navigationItem.rightBarButtonItem = rightBarItem
           }
           
           @objc private func buttonAction() {
               let infoView = InfoViewController()
               navigationController?.pushViewController(infoView, animated: true)
           }
       
   }





