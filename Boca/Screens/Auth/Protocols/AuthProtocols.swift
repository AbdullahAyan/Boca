//
//  AuthProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerAuthProtocol {
    var authPresenter: ViewControllerToPresenterAuthProtocol? { get set }
    
    func register()
    func login()
    func resetPassword()
    func signInWithGoogle()
}

protocol ViewControllerToPresenterAuthProtocol {
    var authInteractor: PresenterToInteractorAuthProtocol? { get set}
    
    func register(withEmail: String, password: String)
    func login(withEmail: String, password: String)
    func resetPassword()
    func signInWithGoogle()
}

protocol PresenterToInteractorAuthProtocol {
    var authPresenter: InteractorToPresenterAuthProtocol? {get set}
    
    func register(withEmail: String, password: String)
    func login(withEmail: String, password: String)
    func resetPassword()
    func signInWithGoogle()
}

// MARK: - Transporter Protocols
protocol InteractorToPresenterAuthProtocol {
    var authViewController: PresentertoViewControllerAuthProtocol? { get set }
    
    func sendResponseToViewController(response: AuthResponse,title: String?,message: String?)
}

protocol PresentertoViewControllerAuthProtocol {
    func sendResponseToViewController(response: AuthResponse,title: String?,message: String?)
}



// MARK: - Router Protocol

protocol PresenterToRouterAuthProtocol {
    static func createModule(ref: AuthViewController)
}

