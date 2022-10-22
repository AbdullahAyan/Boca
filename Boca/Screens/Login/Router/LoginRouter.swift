//
//  LoginRouter.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import Foundation

class LoginRouter: PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginViewController) {
        
//        MARK: - VIPER Components
        let view = LoginView()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        
//        MARK: - View Delegates
        
        ref.loginView?.loginViewController = ref
        
//        MARK: - ViewController Delegates
        ref.loginView = view
        ref.loginPresenter = presenter
        
//        MARK: - Presenter Delegates
        presenter.loginInteractor = interactor
        presenter.loginViewController = ref

//        MARK: - Interactor Delegates
        interactor.loginPresenter = presenter
        
    }
}
