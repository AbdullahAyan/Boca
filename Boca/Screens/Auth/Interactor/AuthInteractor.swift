//
//  AuthInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn

class AuthInteractor: PresenterToInteractorAuthProtocol {
    var authPresenter: InteractorToPresenterAuthProtocol?
    
    @objc func login(withEmail: String, password: String) {

        let email = "abdullahayaneng@icloud.com"
        let password = "123456"

        Auth.auth().languageCode = "tr"
        Auth.auth().signIn(withEmail: email, password: password) { [self] authResult, error in
            if let error {
                authPresenter?.sendResponseToViewController(response: .Failure,title: "Error",message: error.localizedDescription)
            }
            if authResult?.user.email == nil {
                authPresenter?.sendResponseToViewController(response: .Failure,title: "Error",message: "Email or password wrong?")
            }else {
                User.email = (authResult?.user.email)!
                authPresenter?.sendResponseToViewController(response: .Success, title: nil, message: nil)
            }
        }
    }
    
    
    
//    @objc func login(withEmail: String, password: String) {
//        Auth.auth().signIn(withEmail: withEmail, password: password) { [self] authResult, error in
//            if let error {
//                authPresenter?.sendResponseToViewController(response: .Failure,title: "Error",message: error.localizedDescription)
//            } else {
//                User.email = (authResult?.user.email)!
//
//                authPresenter?.sendResponseToViewController(response: .Success, title: nil, message: nil)
//            }
//        }
//    }
//
    
    @objc func signInWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: authPresenter!.authViewController as! UIViewController) { [weak self] user, error in
            
            if let error = error {
                self!.authPresenter?.sendResponseToViewController(response: .Failure,title: "Error",message: error.localizedDescription)
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
            

            Auth.auth().signIn(with: credential) { [self] authResult, error in
                if let error {
                    self!.authPresenter?.sendResponseToViewController(response: .Failure,title: "Error",message: error.localizedDescription)
                    return
                }
                self!.authPresenter?.sendResponseToViewController(response: .Success,title: nil,message: nil)
            }
        }
    }
    
    
    @objc func register(withEmail: String, password: String) {
        Auth.auth().createUser(withEmail: withEmail, password: password) { [weak self] data, error in
            if let error {
                self!.authPresenter?.sendResponseToViewController(response: .Failure,title: "Error",message: error.localizedDescription)
            }
            self!.authPresenter?.sendResponseToViewController(response: .Success,title: nil,message: nil)
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
                        self!.authPresenter?.sendResponseToViewController(response: .Failure,title: "Error",message: error.localizedDescription)
                    } else {
                        self!.authPresenter?.sendResponseToViewController(response: .Success,title: "Success",message: "We have sent an activation code to your e-mail address !")
                    }
                    
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        ac.addAction(sendAction)
        ac.addAction(cancelAction)
        (authPresenter!.authViewController as! UIViewController).present(ac, animated: true)
    }
}


