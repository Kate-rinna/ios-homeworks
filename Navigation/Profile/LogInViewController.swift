//
//  LogInViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 20.05.2022.
//
import UIKit

class LogInViewController: UIViewController {
    
    private let notify = NotificationCenter.default
    
    public let correctLogin = "qwe"
    public var correctPassword = "12345678"
    
    private var stackToButton: NSLayoutConstraint?
    private var alertToButton: NSLayoutConstraint?
    
    

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "logo.jpg")
        logoImage.contentMode = .scaleAspectFill
        return logoImage
    }()


    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0.5
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = .lightGray
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
        }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.indent(size: 10)
        loginTextField.placeholder = "Почта или телефон"
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemGray6
        loginTextField.delegate = self
        loginTextField.addTarget(self, action: #selector(userLogin), for: .editingChanged)
        loginTextField.clearButtonMode = .always
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.returnKeyType = .done
        loginTextField.keyboardAppearance = .alert
        return loginTextField
        }()
    
    @objc private func userLogin() {

    }

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.indent(size: 10)
        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(userPassword), for: .editingChanged)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearButtonMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.keyboardAppearance = .alert
        return passwordTextField
    }()

    @objc private func userPassword() {
    
    }
   
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.setTitle("Войти", for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.titleLabel?.textColor = .white
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.clipsToBounds = true
        logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        return logInButton
    }()

    private lazy var alertLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .systemRed
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Пароль должен содержать от 8 до 16 символов"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func alphaForButton() {
        switch logInButton.state {
        case .normal:
            self.logInButton.alpha = 1.0
        case .selected, .disabled, .highlighted:
            self.logInButton.alpha = 0.8
        default:
            self.logInButton.alpha = 0.8
        }
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(scrollView)
        view.backgroundColor = .white
        self.scrollView.contentSize = self.view.bounds.size
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(logoImage)
        self.contentView.addSubview(stackView)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        self.contentView.addSubview(logInButton)
        self.contentView.addSubview(alertLabel)
        self.setupLayout()
        self.alphaForButton()
    }
    

    private func setupLayout() {

        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),

            NSLayoutConstraint(item: logoImage, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 1),
            
            self.logoImage.widthAnchor.constraint(equalToConstant: 120),
            self.logoImage.heightAnchor.constraint(equalTo: self.logoImage.widthAnchor, multiplier: 1),

            self.stackView.heightAnchor.constraint(equalToConstant: 100),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),

            self.logInButton.heightAnchor.constraint(equalToConstant: 50),
            self.logInButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.logInButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.logInButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),


            self.alertLabel.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            self.alertLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            self.alertLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ])

        self.stackToButton = self.stackView.bottomAnchor.constraint(equalTo: self.logInButton.topAnchor, constant: -16)
        NSLayoutConstraint.activate([self.stackToButton].compactMap( { $0 }))

        let heightView = UIScreen.main.bounds.height
        if heightView < 780 {
            NSLayoutConstraint.activate([
                self.stackView.centerYAnchor.constraint(equalTo: self.contentView.topAnchor, constant: heightView/2),
                self.logoImage.centerYAnchor.constraint(equalTo: self.contentView.topAnchor, constant: heightView/4)
            ])
        } else {
            NSLayoutConstraint.activate([
            self.logoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 100),
            self.logoImage.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -100)
            ])
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.alphaForButton()
    }
   
    @objc func logInButtonAction() {
        self.view.endEditing(true)

        var count = 0
        var flag = true

        if let email = loginTextField.text {
            if email.isEmpty {
                self.shakeTextField(textField: loginTextField)
                count += 1
            } else {
                if email != correctLogin {
                    flag = false
                }
            }
        }

        if let password = passwordTextField.text {
            if password.isEmpty {
                self.shakeTextField(textField: passwordTextField)
                count += 1
            } else {
                let passwordLength = password.count
                if (passwordLength < 8) || (passwordLength > 16) {
                    self.alertLabel.isHidden = false

                    NSLayoutConstraint.deactivate([self.stackToButton].compactMap( { $0 }))

                    self.alertToButton = self.alertLabel.bottomAnchor.constraint(equalTo: self.logInButton.topAnchor, constant: -16)
                    NSLayoutConstraint.activate([self.alertToButton].compactMap( { $0 }))

                    count += 1
                } else {
                    self.alertLabel.isHidden = true
                    NSLayoutConstraint.deactivate([self.alertToButton].compactMap( { $0 }))
                    NSLayoutConstraint.activate([self.stackToButton].compactMap( { $0 }))
                }
                if password != correctPassword {
                    flag = false
                }
            }
        }

        if flag && (count == 0) {
            let profileVC = ProfileViewController()
            profileVC.closure = {
            }
            self.navigationController?.pushViewController(profileVC, animated: true)
        } else if (count == 0) && flag != true {
            let alert = UIAlertController(title: "Внимание", message: "Логин и пароль не подходят", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: { (_) in
                self.passwordTextField.text = ""
                self.loginTextField.text = ""
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notify.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notify.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        scrollView.contentInset.bottom = keyboardSize.height + 32
        scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 32, right: 0)
            }
        }

    @objc private func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        }

    private func shakeTextField(textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 2, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 2, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    }

}


// MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

