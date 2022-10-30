//
//  AuthViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import UIKit


class AuthViewController: UIViewController {
    var authView: AuthView?
    var authPresenter: ViewControllerToPresenterAuthProtocol?
    
    var tabBar: UITabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AuthRouter.createModule(ref: self)
        view = authView
        view.backgroundColor = .white
        }
}



extension AuthViewController: ViewToViewControllerAuthProtocol {
    @objc func login() {
        guard let email = authView?.emailTextField.text, let password = authView?.passwordTextField.text else {
            return
        }
        authPresenter?.login(withEmail: email, password: password)
    }
    
    
    @objc func signInWithGoogle() {
        self.authPresenter?.signInWithGoogle()
    }
    
    
    @objc func resetPassword() {
        self.authPresenter?.resetPassword()
    }
    
    
    @objc func register() {
        guard let email = authView?.emailTextField.text, let password = authView?.passwordTextField.text else {
            return
        }
        authPresenter?.register(withEmail: email, password: password)
    }
    
    
    func authAlert(title: String?,message: String?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        ac.addAction(action)
        present(ac, animated: true)
    }
}


extension AuthViewController: PresentertoViewControllerAuthProtocol {
    func sendResponseToViewController(response: AuthResponse,title: String? = nil,message: String? = nil) {
        switch response {
        case .Failure:
            print("error")
            self.authAlert(title: title, message: message)
        case .Success:
            navigationController?.pushViewController(tabBar!, animated: true)
        }
    } 
}

