//
//  AuthPresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import Foundation

class AuthPresenter: ViewControllerToPresenterAuthProtocol {
    var authInteractor: PresenterToInteractorAuthProtocol?
    var authViewController: PresentertoViewControllerAuthProtocol?
    
    func login(withEmail: String, password: String) {
        authInteractor?.login(withEmail: withEmail, password: password)
    }
    
    func signInWithGoogle() {
        authInteractor?.signInWithGoogle()
    }
    
    func register(withEmail: String, password: String) {
        authInteractor?.register(withEmail: withEmail, password: password)
    }
    
    func resetPassword() {
        authInteractor?.resetPassword()
    }
}

extension AuthPresenter: InteractorToPresenterAuthProtocol {    
    func sendResponseToViewController(response: AuthResponse,title: String? = nil,message: String? = nil) {
        authViewController?.sendResponseToViewController(response: response,title: title,message: message)
    }
}
