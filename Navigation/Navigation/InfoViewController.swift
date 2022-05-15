//
//  InfoViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 15.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .systemBackground
          self.navigationItem.title = "Информация"
          addButton()
      }
      
      private func addButton() {
          let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
          alertButton.center = view.center
          alertButton.setTitle("Изменить", for: .normal)
          alertButton.backgroundColor = .darkGray
          alertButton.layer.cornerRadius = 10
          alertButton.addTarget(self, action: #selector(tapAlertAction), for: .touchUpInside)
          view.addSubview(alertButton)
      }
      
      @objc private func tapAlertAction () {
          let alert = UIAlertController(title: "Информация изменена", message: "Сохранить?", preferredStyle: .alert)
          let okAction = UIAlertAction(title: "Да", style: .default) {_ in
              print("Запись изменена")
              // self.dismiss(animated: true)
              self.navigationController?.popViewController(animated: true)
          }
          let cancelAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
              print("Отмена действия")
          }
          alert.addAction(cancelAction)
          alert.addAction(okAction)
          present(alert, animated: false)
          
      }

  }
