//
//  FeedViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 15.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Мой пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        layout()
    }

    private let stackView: UIStackView = {
          let stackView = UIStackView()
          stackView.translatesAutoresizingMaskIntoConstraints = false
          stackView.axis = .vertical
          stackView.spacing = 10
          return stackView
      }()
      
      private lazy var oneButton: UIButton = {
          let oneButton = UIButton()
          oneButton.translatesAutoresizingMaskIntoConstraints = false
          oneButton.setTitle("Пост", for: .normal)
          oneButton.backgroundColor = .systemGray2
          oneButton.layer.cornerRadius = 16
          oneButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
          return oneButton
      }()
      
      private lazy var twoButton: UIButton = {
          let twoButton = UIButton()
          twoButton.translatesAutoresizingMaskIntoConstraints = false
          twoButton.setTitle("Пост", for: .normal)
          twoButton.backgroundColor = .systemGray3
          twoButton.layer.cornerRadius = 16
          twoButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
          return twoButton
      }()
    
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    private func layout() {
          view.addSubview(stackView)
          [oneButton, twoButton].forEach { stackView.addArrangedSubview($0) }
          
          NSLayoutConstraint.activate([
    
              stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
              stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
              stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
              stackView.heightAnchor.constraint(equalToConstant: 110),
              
              oneButton.heightAnchor.constraint(equalToConstant: 50),
              
              twoButton.heightAnchor.constraint(equalToConstant: 50)
          ])
      }
}
