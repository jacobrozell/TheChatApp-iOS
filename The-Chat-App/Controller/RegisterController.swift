//
//  RegisterViewController.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/22/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import SnapKit
import SVProgressHUD

class RegisterController: UIViewController {
    let logoContainer = UIView()
    let logoLabel = UILabel()
    let logoImage = UIImageView()
    let loginContainer = UIView()
    let registerLabel = UILabel()
    let usernameField = UITextField()
    let passwordField = UITextField()
    let registerButton = UIButton()
    let forgotPassword = UIButton()
    let alreadyUser = UILabel()
    let goToLoginButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = Util().hexStringToUIColor(hex: "#6d84a8")
        self.navigationItem.hidesBackButton = true
        setup()
        setupConstraints()
        
    }
    
    func setup() {
        // Logo Setup
        logoLabel.text = "THE CHAT APP"
        logoLabel.textAlignment = .center
        logoLabel.contentMode = .scaleToFill
        
        // Logo Image
        logoImage.image = UIImage(named: "bubble")
        logoImage.contentMode = .scaleAspectFill
        
        // Login Container
        //loginContainer.backgroundColor = .red
        
        // Login Label
        registerLabel.text = "Register:"
        registerLabel.textAlignment = .left
        
        // Username field
        usernameField.placeholder = "Username: "
        usernameField.keyboardType = .asciiCapable
        usernameField.backgroundColor = .white
        usernameField.layer.masksToBounds = true
        usernameField.borderStyle = .roundedRect
        
        // Password field
        passwordField.placeholder = "Password: "
        passwordField.keyboardType = .asciiCapable
        passwordField.isSecureTextEntry = true
        passwordField.backgroundColor = .white
        passwordField.layer.masksToBounds = true
        passwordField.borderStyle = .roundedRect
        
        // Login Button
        registerButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.darkGray, for: .normal)
        registerButton.layer.cornerRadius = 8.0
        registerButton.layer.masksToBounds = true
        registerButton.backgroundColor = .white
        registerButton.layer.borderWidth = 1.0
        registerButton.layer.borderColor = UIColor.gray.cgColor
        registerButton.layer.cornerRadius = 8.0
        
        // ForgotPassword Button
        forgotPassword.addTarget(self, action: #selector(forgotPasswordPressed), for: .touchUpInside)
        forgotPassword.setTitle("Forgot password?", for: .normal)
        forgotPassword.setTitleColor(.darkGray, for: .normal)
        forgotPassword.layer.cornerRadius = 8.0
        forgotPassword.layer.masksToBounds = true
        forgotPassword.backgroundColor = .white
        
        forgotPassword.layer.borderWidth = 1.0
        forgotPassword.layer.borderColor = UIColor.gray.cgColor
        forgotPassword.layer.cornerRadius = 8.0
        
        // alreadyUser Label
        alreadyUser.text = "Already a user?"
        
        // Register Button
        goToLoginButton.setTitle("Login", for: .normal)
        
        goToLoginButton.addTarget(self, action: #selector(goToLoginPressed), for: .touchUpInside)
        goToLoginButton.setTitleColor(.darkGray, for: .normal)
        goToLoginButton.layer.cornerRadius = 8.0
        goToLoginButton.layer.masksToBounds = true
        goToLoginButton.backgroundColor = .white
        goToLoginButton.layer.borderWidth = 1.0
        goToLoginButton.layer.borderColor = UIColor.gray.cgColor
        goToLoginButton.layer.cornerRadius = 8.0
    }
    
    func setupConstraints() {
        view.addSubview(logoContainer)
        logoContainer.addSubview(logoLabel)
        logoContainer.addSubview(logoImage)
        
        view.addSubview(loginContainer)
        loginContainer.addSubview(registerLabel)
        loginContainer.addSubview(usernameField)
        loginContainer.addSubview(passwordField)
        loginContainer.addSubview(registerButton)
        loginContainer.addSubview(forgotPassword)
        
        view.addSubview(alreadyUser)
        view.addSubview(goToLoginButton)
        
        
        // LogoContainer
        logoContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        // Logo Label Constraints
        logoLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(logoImage.snp.left)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        // Logo Image Constraints
        logoImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(logoLabel.snp.right)
        }
        
        loginContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(logoContainer.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-50)
            make.bottom.equalToSuperview().offset(-100)
        }
        
        registerLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        usernameField.snp.makeConstraints { (make) in
            make.top.equalTo(registerLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameField.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        forgotPassword.snp.makeConstraints { (make) in
            make.top.equalTo(registerButton.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(165)
            make.height.equalTo(30)
        }
        
        alreadyUser.snp.makeConstraints { (make) in
            make.bottom.equalTo(goToLoginButton.snp.top)
            make.left.equalTo(goToLoginButton.snp.left)
            make.height.equalTo(30)
            make.width.equalTo(130)
        }
        
        goToLoginButton.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview().offset(-100)
            make.bottom.left.equalToSuperview().offset(100)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func loginPressed() {
        print("loginPressed")
        self.dismiss(animated: true) {
            self.navigationController?.pushViewController(AppController(), animated: true)
            self.navigationItem.hidesBackButton = false
        }
    }
    
    @objc func forgotPasswordPressed() {
        print("forgotPasswordPresed")
    }
    
    @objc func goToLoginPressed() {
        self.navigationController?.pushViewController(LoginController(), animated: true)
        self.navigationItem.hidesBackButton = false
    }
}
