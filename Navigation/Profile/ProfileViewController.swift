//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 16.05.2022.
//

import UIKit

//class ProfileViewController: UIViewController {
//
//    let profileHeader = ProfileHeaderView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(profileHeader)
//        view.backgroundColor = .white
//    }
//    override func viewWillLayoutSubviews(){
//        super.view.addSubview(profileHeader)
//        profileHeader.backgroundColor = .lightGray
//        profileHeader.frame = view.safeAreaLayoutGuide.layoutFrame
//
//       }
//
//}
class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private let profileHeader: ProfileHeaderView = {
    let profileHeader = ProfileHeaderView()
        profileHeader.backgroundColor = .lightGray
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        return profileHeader
    }()
    
    private lazy var newButton: UIButton = {
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.backgroundColor = .red
        newButton.setTitle("Кнопка", for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.addTarget(self, action: #selector(clickNewButton), for: .touchUpInside)
        return newButton
    }()
    
    @objc private func clickNewButton() {
        print("Нажатие на кнопку")
    }

    private func setupLayout() {
        view.addSubview(profileHeader)
        view.addSubview(newButton)
      
        NSLayoutConstraint.activate([
            
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeader.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
