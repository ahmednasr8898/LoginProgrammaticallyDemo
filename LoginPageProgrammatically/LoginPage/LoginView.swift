//
//  LoginView.swift
//  ConcurrencyTestDemo
//
//  Created by Semicolon on 05/12/2022.
//

import UIKit

class LoginView: UIView {
    
    var userImageViewTapped: (()->())?
    var loginTapped: (()->())?
    var registerTapped: (()->())?
    
    var userName: String! {
        didSet {
            userNameEditingChanged?()
        }
    }
    var userNameEditingChanged: (()->())?
    
    private lazy var stack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userImageView, userNameTextField, userNameTextField2, passwordTextField, stack2])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var stack2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginButton, registerButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
   
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "square.and.arrow.up"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        let tap = UITapGestureRecognizer(target: self, action: #selector(userImageViewAction))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    @objc private func userImageViewAction() {
        userImageViewTapped?()
    }
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter name"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.addTarget(self, action: #selector(userNameTextFieldAction), for: .editingChanged)
        return textField
    }()
    
    @objc private func userNameTextFieldAction() {
        userName = userNameTextField.text!
    }
    
    private lazy var userNameTextField2: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter name2"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter password"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginButtonWasTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func loginButtonWasTapped() {
        loginTapped?()
    }
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Register", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(registerButtonWasTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func registerButtonWasTapped() {
        registerTapped?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(stack)
    }
    
    private func setupConstraintStackView() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setupConstraintUserNameTextField() {
        NSLayoutConstraint.activate([
            userNameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupConstraintPasswordTextField() {
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor, multiplier: 1)
        ])
    }
    
    private func setupConstraintLoginButton() {
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func layoutUI() {
        addSubviews()
        setupConstraintStackView()
        setupConstraintUserNameTextField()
        setupConstraintPasswordTextField()
        setupConstraintLoginButton()
    }
}
