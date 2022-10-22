//
//  LoginViewController.swift
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
import AuthenticationServices

class LoginViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!

    }
    
    
    
    
    var loginView: LoginView?
    var loginPresenter: ViewControllerToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        LoginRouter.createModule(ref: self)
        view = loginView
        view.backgroundColor = .white
    }
    
    
}



extension LoginViewController: ViewToViewControllerLoginProtocol {
    
    @objc func signInWithApple() {
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
    }
    
    
    @objc func signInWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            if let error = error {
                // ...
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
                print(authResult?.user.email)
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
    
    
    @objc func login() {
        
        guard let loginView, let email = loginView.emailTextField.text,let password = loginView.passwordTextField.text else {
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

