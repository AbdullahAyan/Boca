//
//  FoodProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerFoodProtocol {
    var foodPresenter: ViewControllerToPresenterFoodProtocol? { get set }
    
}

protocol ViewControllerToPresenterFoodProtocol {
    var foodInteractor: PresenterToInteractorFoodProtocol? { get set}
}

protocol PresenterToInteractorFoodProtocol {
    
}

// MARK: - Transporter Protocols

protocol ViewControllerToViewFoodProtocol {
    func initFood(food: Yemekler.Yemek)
}


// MARK: - Router Protocol

protocol PresenterToRouterFoodProtocol {
    static func createModule(ref: FoodViewController)
}
