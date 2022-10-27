//
//  FoodPresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

class FoodPresenter {
    var foodInteractor: PresenterToInteractorFoodProtocol?
}

extension FoodPresenter: ViewControllerToPresenterFoodProtocol {
    func addToChart(food: Yemekler.Yemek, totalPrice: Double, entity: Int) {
        foodInteractor?.addToChart(food: food, totalPrice: totalPrice, entity: entity)
    }
}
