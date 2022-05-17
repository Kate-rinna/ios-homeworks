//
//  FeedViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 15.05.2022.
//

import UIKit

struct Post {
    var title = "Пост"
}

class FeedViewController: UIViewController {
    var post = Post(title: "Мой пост")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        makeButton()
    }
    
    func makeButton(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("Перейти на пост", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func tapAction() {
        let postView = PostViewController()
        postView.postTitle = post.title
        navigationController?.pushViewController(postView, animated: true)
    }
}
