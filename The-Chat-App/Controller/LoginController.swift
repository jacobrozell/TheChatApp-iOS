//
//  LoginController.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/21/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import SnapKit
import SVProgressHUD

class LoginController: UIViewController {
    let logoContainer = UIView()
    let logoLabel = UILabel()
    let logoImage = UIImageView()
    let loginContainer = UIView()
    let loginLabel = UILabel()
    let usernameField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton()
    let forgotPassword = UIButton()
    let notUserLabel = UILabel()
    let registerButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = hexStringToUIColor(hex: "#6d84a8")
        setup()
        setupConstraints()
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
        loginLabel.text = "Login:"
        loginLabel.textAlignment = .left
        
        // Username field
        usernameField.placeholder = "Username: "
        usernameField.keyboardType = .asciiCapable
        usernameField.backgroundColor = .white
        //usernameField.layer.cornerRadius = 8.0
        usernameField.layer.masksToBounds = true
        usernameField.borderStyle = .roundedRect
        
        // Password field
        passwordField.placeholder = "Password: "
        passwordField.keyboardType = .asciiCapable
        passwordField.isSecureTextEntry = true
        passwordField.backgroundColor = .white
        //passwordField.layer.cornerRadius = 8.0
        passwordField.layer.masksToBounds = true
        passwordField.borderStyle = .roundedRect
        
        // Login Button
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.darkGray, for: .normal)
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
        loginButton.backgroundColor = .white
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = UIColor.gray.cgColor
        loginButton.layer.cornerRadius = 8.0
        
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
        
        // NotaUser Label
        notUserLabel.text = "Not a user?"
        
        // Register Button
        registerButton.setTitle("Register", for: .normal)
    }
    
    func setupConstraints() {
        view.addSubview(logoContainer)
        logoContainer.addSubview(logoLabel)
        logoContainer.addSubview(logoImage)
        
        view.addSubview(loginContainer)
        loginContainer.addSubview(loginLabel)
        loginContainer.addSubview(usernameField)
        loginContainer.addSubview(passwordField)
        loginContainer.addSubview(loginButton)
        loginContainer.addSubview(forgotPassword)
        
        view.addSubview(notUserLabel)
        view.addSubview(registerButton)
        
        
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
        
        loginLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        usernameField.snp.makeConstraints { (make) in
            make.top.equalTo(loginLabel.snp.bottom).offset(4)
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
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        
        forgotPassword.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(165)
            make.height.equalTo(20)
        }
        
        notUserLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.right.equalTo(registerButton.snp.left)
            make.height.equalTo(30)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.left.equalTo(notUserLabel.snp.right)
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(30)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func loginPressed() {
        print("loginPressed")
        self.navigationController?.pushViewController(AppController(), animated: true)
    }
    
    @objc func forgotPasswordPressed() {
        print("forgotPasswordPresed")
    }
}
