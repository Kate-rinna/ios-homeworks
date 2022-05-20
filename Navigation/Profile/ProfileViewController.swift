//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 16.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileHeader)
        view.backgroundColor = .white
    }
    override func viewWillLayoutSubviews(){
        super.view.addSubview(profileHeader)
        profileHeader.backgroundColor = .lightGray
        profileHeader.frame = view.safeAreaLayoutGuide.layoutFrame
        
       }
    
}
