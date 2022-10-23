//
//  MenuRouter.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import Foundation

class MenuRouter: PresenterToRouterMenuProtocol {
    static func createModule(ref: MenuViewController) {
        
//        MARK: - VIPER Components
        let view = MenuView()
        let presenter = MenuPresenter()
        let interactor = MenuInteractor()
        
//        MARK: - View Delegates
        
        ref.menuView?.menuViewController = ref
        
//        MARK: - ViewController Delegates
        ref.menuView = view
        ref.menuPresenter = presenter
        
//        MARK: - Presenter Delegates
        presenter.menuInteractor = interactor
        presenter.menuViewController = ref

//        MARK: - Interactor Delegates
        interactor.menuPresenter = presenter
        
    }
}
