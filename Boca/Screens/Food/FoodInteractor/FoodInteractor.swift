//
//  FoodInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

class FoodInteractor {}

extension FoodInteractor: PresenterToInteractorFoodProtocol {
    func addToChart(food: Yemekler.Yemek, totalPrice: Double, entity: Int) {
        print("added")
    }
}
