//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Iurasova Katya on 16.05.2022.
//

import UIKit

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

class ProfileHeaderView: UIView {

    private var statusText = String()

      override init(frame: CGRect) {
          super.init(frame: frame)
          setupView()
      }

      required init?(coder: NSCoder) {
          super.init(coder: coder)
      }

      lazy var profileImage: UIImageView = {
          let profileImage = UIImageView()
          profileImage.translatesAutoresizingMaskIntoConstraints = false
          profileImage.image = UIImage(named: "norwich_terrier_dog")
          profileImage.contentMode = .scaleAspectFill
          profileImage.clipsToBounds = true
          profileImage.backgroundColor = .systemBackground
          profileImage.layer.cornerRadius = 55.0
          profileImage.layer.borderWidth = 3.0
          profileImage.layer.borderColor = UIColor.white.cgColor
          return profileImage
      }()

      lazy var profileName: UILabel = {
          let profileName = UILabel()
          profileName.translatesAutoresizingMaskIntoConstraints = false
          profileName.text = "Норвич-терьер"
          profileName.textColor = .black
          profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
          return profileName
      }()

      lazy var profileStatus: UITextField = {
          let profileStatus = UITextField()
          profileStatus.translatesAutoresizingMaskIntoConstraints = false
          profileStatus.text = "Ожидание статуса..."
          profileStatus.textColor = .gray
          profileStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
          profileStatus.isUserInteractionEnabled = false
          return profileStatus
      }()

      lazy var statusButton: UIButton = {
          let statusButton = UIButton()
          statusButton.translatesAutoresizingMaskIntoConstraints = false
          statusButton.backgroundColor = .systemBlue
          statusButton.setTitle("Показать статус", for: .normal)
          statusButton.setTitleColor(UIColor.white, for: .normal)
          statusButton.layer.cornerRadius = 16.0
          statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
          statusButton.layer.shadowRadius = 4.0
          statusButton.layer.shadowColor = UIColor.black.cgColor
          statusButton.layer.shadowOpacity = 0.7
          statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
          return statusButton
      }()

      @objc private func buttonPressed() {
          profileStatus.text = statusText
          newStatus.text = "Ваш статус"
          self.endEditing(true)
          print(statusText)
      }

      lazy var newStatus: UITextField = {
          let newStatus = UITextField()
          newStatus.translatesAutoresizingMaskIntoConstraints = false
          newStatus.indent(size: 10)
          newStatus.text = "Ваш статус"
          newStatus.textColor = .black
          newStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
          newStatus.backgroundColor = .white
          newStatus.layer.borderWidth = 1.0
          newStatus.layer.borderColor = UIColor.black.cgColor
          newStatus.layer.cornerRadius = 12.0
          newStatus.addTarget(self, action: #selector(statusTextChanges), for: .editingChanged)
        
          return newStatus
      }()
    

      @objc private func statusTextChanges() {
          statusText = newStatus.text!
          print("Статус изменен")
      }

      private func setupLayout(){
          NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            profileImage.heightAnchor.constraint(equalToConstant: 110.0),
            profileImage.widthAnchor.constraint(equalToConstant: 110.0),

            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16.0),
            profileName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            profileName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),

            profileStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16.0),
            profileStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            profileStatus.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -64.0),

            newStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16.0),
            newStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            newStatus.topAnchor.constraint(equalTo: profileStatus.bottomAnchor, constant: 8.0),
            newStatus.heightAnchor.constraint(equalToConstant: 40),

            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            statusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16.0),
            statusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            statusButton.heightAnchor.constraint(equalToConstant: 50.0)
          ])
      }

      private func setupView(){
          addSubview(profileImage)
          addSubview(profileName)
          addSubview(profileStatus)
          addSubview(statusButton)
          addSubview(newStatus)
          setupLayout()
      }

}
