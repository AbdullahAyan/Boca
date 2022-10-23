//
//  AuthViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import GoogleSignIn

class AuthViewController: UIViewController {

    var authView: AuthView?
    var authPresenter: ViewControllerToPresenterAuthProtocol?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthRouter.createModule(ref: self)
        view = authView
        view.backgroundColor = .white
    }
}



extension AuthViewController: ViewToViewControllerAuthProtocol {
    
    @objc func login() {
        
        guard let authView, let email = authView.emailTextField.text,let password = authView.passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          
            if let error {
                print(error)
            }
            
            print(authResult?.user.email ?? "")
            
        }
    }
    

    
    
    
    @objc func signInWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [weak self] user, error in
            
            if let error = error {
                self?.authAlert(title: "Error", message: error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            

            Auth.auth().signIn(with: credential) { authResult, error in
                print(authResult?.user.email as Any)
                return
            }

        }
    }
    
    
    
    @objc func resetPassword() {
        
        let ac = UIAlertController(title: "Reset Password", message: "Write the email you forgot the password. We will send an activation code.", preferredStyle: .alert)
        ac.addTextField()
        let sendAction = UIAlertAction(title: "Send", style: .default) { _ in
            if let email = ac.textFields?[0].text {
                Auth.auth()
                Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
                    if let error {
                        self?.authAlert(title: "Error", message: error.localizedDescription)
                    } else {
                        self?.authAlert(title: "Success", message: "We have sent an activation code to your e-mail address !")
                    }
                    
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        ac.addAction(sendAction)
        ac.addAction(cancelAction)
        present(ac, animated: true)
    }
    
    
    @objc func register() {
        
        guard let authView, let email = authView.emailTextField.text,let password = authView.passwordTextField.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] data, error in
            if let error {
                self?.authAlert(title: "Error", message: error.localizedDescription)
            }
        }
        
        
        
    }
    
    func authAlert(title: String,message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    
    
    
    
}

