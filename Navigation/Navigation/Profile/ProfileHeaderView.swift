//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Iurasova Katya on 16.05.2022.
//

 import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func userInteractionEnabled()
    func userInteractionDisabled()
}

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: ProfileHeaderViewDelegate?
    private var statusText = String()

      override init(reuseIdentifier: String?) {
          super.init(reuseIdentifier: reuseIdentifier)
          setupLayout()
          setupGestures()
      }

      required init?(coder: NSCoder) {
          super.init(coder: coder)
      }

    private lazy var avatarImagePosition = avatarImageView.layer.position
    private lazy var avatarImageBounds = avatarImageView.layer.bounds

    private lazy var imageAvatarView: UIView = {
        let imageAvatarView = UIView()
        imageAvatarView.translatesAutoresizingMaskIntoConstraints = false
        imageAvatarView.backgroundColor = .black
        imageAvatarView.isUserInteractionEnabled = false
        imageAvatarView.alpha = 0
          return imageAvatarView
      }()
    lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "norwich_terrier_dog")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.backgroundColor = .systemBackground
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()

    private lazy var reduceAvatarButton: UIButton = {
        let reduceAvatarButton = UIButton()
        reduceAvatarButton.translatesAutoresizingMaskIntoConstraints = false
        reduceAvatarButton.setImage(UIImage(systemName: "clear.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50)), for: .normal)
        reduceAvatarButton.alpha = 0.0
        reduceAvatarButton.clipsToBounds = false
        reduceAvatarButton.addTarget(self, action: #selector(reduceAvatarAction), for: .touchUpInside)
        reduceAvatarButton.isUserInteractionEnabled = false
        return reduceAvatarButton
    }()

    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "Норвич-терьер"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return fullNameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Ожидание статуса..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.isUserInteractionEnabled = false
        return statusLabel
    }()
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.indent(size: 10)
        statusTextField.placeholder = "Ваш статус"
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.backgroundColor = .white
        statusTextField.alpha = 0.7
        statusTextField.layer.borderWidth = 1.0
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12.0
        statusTextField.delegate = self
        statusTextField.addTarget(self, action: #selector(statusTextChanges), for: .editingChanged)
        return statusTextField
    }()

    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = UIColor(hex: 0x4885CC)
        setStatusButton.setTitle("Показать статус", for: .normal)
        setStatusButton.setTitleColor(UIColor.white, for: .normal)
        setStatusButton.layer.cornerRadius = 16.0
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return setStatusButton
    }()
    
    @objc func buttonPressed() {
        if ((self.statusTextField.text ?? "").isEmpty) {
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut) {
                self.statusTextField.backgroundColor = .red
                self.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut) {
                    self.statusTextField.backgroundColor = .white
                }
            }
            return
        }
        self.statusLabel.text = self.statusText
        self.statusTextField.text = ""
           
        self.statusTextField.delegate = self
        self.endEditing(true)
       }
        

    @objc private func statusTextChanges() {
        statusText = statusTextField.text!
        print("Статус изменен")
    }
    
    private func setupGestures() {
      let tapAvatarGesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatarImage))
      avatarImageView.addGestureRecognizer(tapAvatarGesture)
    }
    @objc func tapAvatarImage() {
    
     self.avatarImagePosition = self.avatarImageView.layer.position
     self.avatarImageBounds = self.avatarImageView.layer.bounds
    
     UIImageView.animate(withDuration: 0.5,
                            animations: {
        self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: (UIScreen.main.bounds.midY))
        self.imageAvatarView.alpha = 0.7
        self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        self.avatarImageView.layer.cornerRadius = 0
        self.avatarImageView.layer.borderWidth = 0
        self.avatarImageView.isUserInteractionEnabled = false
        self.setStatusButton.isUserInteractionEnabled = false
        self.statusTextField.isUserInteractionEnabled = false
        self.delegate?.userInteractionDisabled()
        self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    },
                            completion: { _ in
      UIImageView.animate(withDuration: 0.3) {
        self.reduceAvatarButton.alpha = 1
        self.reduceAvatarButton.isUserInteractionEnabled = true
        self.layoutIfNeeded()
            }
        })
    }
    @objc private func reduceAvatarAction() {
        UIView.animate(withDuration: 0.3, delay: 0.0,
                       usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0,
                        options: .curveEaseInOut) {
             self.reduceAvatarButton.alpha = 0
             self.reduceAvatarButton.isUserInteractionEnabled = false
         } completion: { _ in
             UIView.animate(withDuration: 0.5, delay: 0.0) {
             self.imageAvatarView.alpha = 0.0
             self.avatarImageView.layer.position = self.avatarImagePosition
             self.avatarImageView.layer.bounds = self.avatarImageBounds
             self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
             self.avatarImageView.layer.borderWidth = 3
             self.avatarImageView.isUserInteractionEnabled = true
             self.setStatusButton.isUserInteractionEnabled = true
             self.statusTextField.isUserInteractionEnabled = true
             self.statusTextField.isUserInteractionEnabled = true
             self.delegate?.userInteractionEnabled()
             self.layoutIfNeeded()
             }
         }
     }
    private func setupLayout(){
          [fullNameLabel, statusLabel, setStatusButton, statusTextField, imageAvatarView, avatarImageView, reduceAvatarButton].forEach { addSubview($0) }

        NSLayoutConstraint.activate([
          avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
          avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
          avatarImageView.heightAnchor.constraint(equalToConstant: 110.0),
          avatarImageView.widthAnchor.constraint(equalToConstant: 110.0),

          fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
          fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
          fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),

          statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
          statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
          statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -64.0),

          statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
          statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
          statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8.0),
          statusTextField.heightAnchor.constraint(equalToConstant: 40),

          setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
          setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16.0),
          setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
          setStatusButton.heightAnchor.constraint(equalToConstant: 50.0),

          imageAvatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
          imageAvatarView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
          imageAvatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
          imageAvatarView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),

          reduceAvatarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
          reduceAvatarButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
}

// MARK: - UITextField
 extension UITextField {
     func indent(size:CGFloat) {
         self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
         self.leftViewMode = .always
     }
 }

// MARK: - UITextFieldDelegate
 extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
