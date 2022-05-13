//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Iurasova Katya on 13.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       // view.backgroundColor = .green
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    print("screenWidth = \(screenWidth)")
    print("screenHeight = \(screenHeight)")
    
    if let myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
        myView.frame = CGRect(x: 16, y: 100, width: screenWidth - 32, height: 500)
        view.addSubview(myView)
    }
    
   // if let myView2 = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
    //    myView2.frame = CGRect(x: 16, y: 470, width: screenWidth - 32, height: 400)
      //  view.addSubview(myView2)
    //}

    }
}
