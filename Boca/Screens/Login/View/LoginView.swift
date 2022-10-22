//
//  LoginView.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import UIKit
import GoogleSignIn
import AuthenticationServices

class LoginView: UIView {
    
    var loginViewController: LoginViewController?
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pacifico-Regular", size: 36)
        label.text = "Welcome to Boca"
        return label
    }()
    
    private lazy var loginText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mukta-Medium", size: 16)
        label.text = " \"Boca\" the most delicious food on your plate."
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "email"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "password"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none

        textField.isSecureTextEntry = true

        return textField
    }()
    
    private lazy var resetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset Password", for: .normal)
        button.titleLabel?.font = UIFont(name: "Mukta-Medium", size: 12)
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)

        button.addTarget(loginViewController, action: #selector(loginViewController?.resetPassword), for: .touchUpInside)
        
        return button
    }()
    

    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "Mukta-Medium", size: 16)
        button.backgroundColor = .black
        
        button.layer.cornerRadius = 5
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        
        button.addTarget(loginViewController, action: #selector(loginViewController?.login), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Mukta-Medium", size: 16)
        button.backgroundColor = .red
        
        button.layer.cornerRadius = 5
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        
        return button
    }()
    
    private lazy var dividerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "rectangle.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private lazy var signWithGoogleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.style = .wide
        button.colorScheme = .light
        
        button.addTarget(loginViewController, action: #selector(loginViewController?.signInWithGoogle), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var signWithAppleButton: ASAuthorizationAppleIDButton = {

        
        let authorizationButton = ASAuthorizationAppleIDButton()
        
        authorizationButton.addTarget(loginViewController, action: #selector(loginViewController?.signInWithApple), for: .touchUpInside)
        
        return authorizationButton
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(120)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        addSubview(loginText)
        loginText.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(20)
            make.centerX.equalTo(loginLabel.snp.centerX)

        }
        
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(loginText.snp.bottom).offset(24)
            make.centerX.equalTo(loginText)
            make.width.equalTo(loginText)
        }
        
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.centerX.equalTo(emailTextField)
            make.width.equalTo(emailTextField)
        }
        
        addSubview(resetPasswordButton)
        resetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom)
            make.trailing.equalTo(passwordTextField).offset(-8)
        }
        
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(48)
            make.centerX.equalTo(passwordTextField).offset(75)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(48)
            make.centerX.equalTo(passwordTextField).offset(-75)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        addSubview(dividerImageView)
        dividerImageView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(36)
            make.left.equalTo(safeAreaLayoutGuide)
            make.right.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(5)
        }
        
        addSubview(signWithGoogleButton)
        signWithGoogleButton.snp.makeConstraints { make in
            make.top.equalTo(dividerImageView.snp.bottom).offset(36)
            make.centerX.equalTo(dividerImageView)

        }
        
        addSubview(signWithAppleButton)
        signWithAppleButton.snp.makeConstraints { make in
            make.top.equalTo(signWithGoogleButton.snp.bottom).offset(36)
            make.centerX.equalTo(signWithGoogleButton)

        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    
}
