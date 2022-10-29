//
//  FoodRouter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation


class FoodRouter: PresenterToRouterFoodProtocol {
    static func createModule(ref: FoodViewController) {
        
//        MARK: - VIPER Components
        let view = FoodView()
        let presenter = FoodPresenter()
        let interactor = FoodInteractor()
        
//        MARK: - View Delegates
        view.foodViewController = ref
 
//        MARK: - ViewController Delegates
        ref.foodView = view
        ref.foodPresenter = presenter
        

//        MARK: - Presenter Delegates
        presenter.foodInteractor = interactor
        
    }
}
