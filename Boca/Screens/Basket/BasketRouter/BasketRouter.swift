//
//  BasketRouter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation


class BasketRouter: PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketViewController) {
        
//        MARK: - VIPER Components
        let view = BasketView()
        
        let presenter = BasketPresenter()
        let interactor = BasketInteractor()
        
//        MARK: - View Delegates
        view.basketViewController = ref
 
//        MARK: - ViewController Delegates
        ref.basketView = view
        ref.basketPresenter = presenter
        

//        MARK: - Presenter Delegates
        presenter.basketInteractor = interactor
        presenter.basketViewController = ref

//        MARK: - Interactor Delegates
        interactor.basketPresenter = presenter
        
    }
}
