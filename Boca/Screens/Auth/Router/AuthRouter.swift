//
//  AuthRouter.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import Foundation

class AuthRouter: PresenterToRouterAuthProtocol {
    static func createModule(ref: AuthViewController) {
        
//        MARK: - VIPER Components
        let view = AuthView()
        let presenter = AuthPresenter()
        let interactor = AuthInteractor()
        
//        MARK: - ViewController Delegates
        ref.authView = view
        ref.authPresenter = presenter
        
//        MARK: - Presenter Delegates
        presenter.authInteractor = interactor
        presenter.authViewController = ref

//        MARK: - Interactor Delegates
        interactor.authPresenter = presenter
        
    }
}
