//
//  ProfileView.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

final class ProfileView: UIView {

    var profileViewController: ProfileViewController?
  
    private lazy var profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "swift")
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "İsim"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Kaydet", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var ordersTableView: UITableView = {
        let tableView = UITableView()
    
        return tableView
    }()
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Çıkış Yap", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.left.equalTo(safeAreaLayoutGuide).offset(30)
            make.width.equalTo(profileImageView.snp.height)
            make.width.equalTo(120)
        }
        
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileImageView)
            make.left.equalTo(profileImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.left.right.equalTo(nameTextField)
        }
        
        addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.right.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.height.equalTo(emailTextField)
            make.width.equalTo(100)
        }
        
        addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(saveButton.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        
        addSubview(ordersTableView)
        ordersTableView.snp.makeConstraints { make in
            make.top.equalTo(logOutButton.snp.bottom)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


