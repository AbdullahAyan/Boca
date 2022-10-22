//
//  LoginProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerLoginProtocol {
    var loginView: LoginView? { get set }
    var loginPresenter: ViewControllerToPresenterLoginProtocol? { get set }
    
    func login()
    func resetPassword()
    func signInWithGoogle()
    func signInWithApple()
}

protocol ViewControllerToPresenterLoginProtocol {
    var loginViewController: ViewToViewControllerLoginProtocol? { get set }
    var loginInteractor: PresenterToInteractorLoginProtocol? { get set}
}

protocol PresenterToInteractorLoginProtocol {
    var loginPresenter: ViewControllerToPresenterLoginProtocol? { get set }
}

// MARK: - Router Protocol

protocol PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginViewController)
}

