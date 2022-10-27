//
//  FoodProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerFoodProtocol {
    var foodView: FoodView? { get set }
    var foodPresenter: ViewControllerToPresenterFoodProtocol? { get set }
    
}

protocol ViewControllerToPresenterFoodProtocol {
    var foodViewController: ViewToViewControllerFoodProtocol? { get set }
    var foodInteractor: PresenterToInteractorFoodProtocol? { get set}
}

protocol PresenterToInteractorFoodProtocol {
    var foodPresenter: ViewControllerToPresenterFoodProtocol? { get set }
}

// MARK: - Transporter Protocols

protocol ViewControllerToViewFoodProtocol {
    func initFood(food: Yemekler.Yemek)
}


// MARK: - Router Protocol

protocol PresenterToRouterFoodProtocol {
    static func createModule(ref: FoodViewController)
}
