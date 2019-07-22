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
import Firebase
import FirebaseDatabase


class RegisterController: UIViewController, UITextFieldDelegate {
    let logoContainer = UIView()
    let logoImage = UIImageView()
    let registerContainer = UIView()
    let registerLabel = UILabel()
    let usernameField = UITextField()
    let emailField = UITextField()
    let passwordField = UITextField()
    let confirmPassword = UITextField()
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
        
        // Logo Image
        logoImage.image = #imageLiteral(resourceName: "textlogo")
        logoImage.contentMode = .center
        
        // Register Label
        registerLabel.text = "Register:"
        registerLabel.textAlignment = .left
        
        // Username Field
        usernameField.placeholder = "Username: "
        usernameField.keyboardType = .asciiCapable
        usernameField.backgroundColor = .white
        usernameField.layer.masksToBounds = true
        usernameField.borderStyle = .roundedRect
        usernameField.delegate = self
        
        // Email Field
        emailField.placeholder = "Email: "
        emailField.keyboardType = .asciiCapable
        emailField.backgroundColor = .white
        emailField.layer.masksToBounds = true
        emailField.borderStyle = .roundedRect
        emailField.delegate = self
        
        // Password Field
        passwordField.placeholder = "Password: "
        passwordField.keyboardType = .asciiCapable
        passwordField.isSecureTextEntry = true
        passwordField.backgroundColor = .white
        passwordField.layer.masksToBounds = true
        passwordField.borderStyle = .roundedRect
        passwordField.delegate = self
        
        // Confirm Passworld Field
        confirmPassword.placeholder = "Confirm Password: "
        confirmPassword.keyboardType = .asciiCapable
        confirmPassword.isSecureTextEntry = true
        confirmPassword.backgroundColor = .white
        confirmPassword.layer.masksToBounds = true
        confirmPassword.borderStyle = .roundedRect
        passwordField.delegate = self
        
        // Register Button
        registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.darkGray, for: .normal)
        registerButton.layer.cornerRadius = 8.0
        registerButton.layer.masksToBounds = true
        registerButton.backgroundColor = .white
        registerButton.layer.borderWidth = 1.0
        registerButton.layer.borderColor = UIColor.gray.cgColor
        registerButton.layer.cornerRadius = 8.0
        
        // Forgot Password Button
        forgotPassword.addTarget(self, action: #selector(forgotPasswordPressed), for: .touchUpInside)
        forgotPassword.setTitle("Forgot password?", for: .normal)
        forgotPassword.setTitleColor(.darkGray, for: .normal)
        forgotPassword.layer.cornerRadius = 8.0
        forgotPassword.layer.masksToBounds = true
        forgotPassword.backgroundColor = .white

        forgotPassword.layer.borderWidth = 1.0
        forgotPassword.layer.borderColor = UIColor.gray.cgColor
        forgotPassword.layer.cornerRadius = 8.0
        
        // Already User Label
        alreadyUser.text = "Already a user?"
        
        // Login Button
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
        logoContainer.addSubview(logoImage)
        
        view.addSubview(registerContainer)
        registerContainer.addSubview(registerLabel)
        registerContainer.addSubview(usernameField)
        registerContainer.addSubview(emailField)
        registerContainer.addSubview(passwordField)
        registerContainer.addSubview(confirmPassword)
        registerContainer.addSubview(registerButton)
        registerContainer.addSubview(forgotPassword)
        
        view.addSubview(alreadyUser)
        view.addSubview(goToLoginButton)
        
        // LogoContainer
        logoContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        // Logo Image Constraints
        logoImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.left.equalToSuperview()
            make.bottom.equalTo(registerContainer.snp.top)
        }
        
        // Regsiter Container
        registerContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(logoContainer.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-50)
            make.bottom.equalToSuperview().offset(-100)
        }
        
        // Regsiter Label
        registerLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        // Username Field
        usernameField.snp.makeConstraints { (make) in
            make.top.equalTo(registerLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        // Email Field
        emailField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameField.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        // Passworld Field
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(emailField.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        // Passworld Field
        confirmPassword.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        // Regsiter Button
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(confirmPassword.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        // Forgot Password
        forgotPassword.snp.makeConstraints { (make) in
            make.top.equalTo(registerButton.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(165)
            make.height.equalTo(30)
        }
        
        // Already User Button
        alreadyUser.snp.makeConstraints { (make) in
            make.bottom.equalTo(goToLoginButton.snp.top)
            make.left.equalTo(goToLoginButton.snp.left)
            make.height.equalTo(30)
            make.width.equalTo(130)
        }
        
        // GoToLogin Button
        goToLoginButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-100)
            make.bottom.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(100)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    @objc func registerPressed() {
        print("registerPressed")
        guard let email = usernameField.text, let password = passwordField.text else { return }
        if passwordField.text == confirmPassword.text {
            SVProgressHUD.show()
            
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                
                // Error Occurred - Show Error
                if error != nil {
                    print(error!)
                    let alert = UIAlertController(title: "Registration Failed!", message: "Please make sure:\n•Email is in correct format\n•Password is at least 6 characters long\n•Passwords Match", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
                
                // Success - Regsiter and log user in
                else {
                    let alert = UIAlertController(title: "Registration Successful!", message: "Welcome to The Chat App!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: { (void) in
                        let userDB = Database.database().reference().child("users")
                        //userDB.
                        self.navigationController?.pushViewController(AppController(), animated: true)
                    }))
                    SVProgressHUD.dismiss()
                    self.present(alert, animated: true)
                }
            }
            SVProgressHUD.dismiss()
        } else {
            let alert = UIAlertController(title: "Registration Failed!", message: "Please make sure:\n•Email is in correct format\n•Password is at least 6 characters long\n•Passwords Match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: { (void) in
                self.passwordField.text = ""
                self.confirmPassword.text = ""
            }))
            self.present(alert, animated: true)
        }
    }
    
    @objc func forgotPasswordPressed() {
        print("forgotPasswordPresed")
    }
    
    @objc func goToLoginPressed() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(LoginController(), animated: true)
    }
}
