//
//  BasketPresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import UIKit
import Alamofire

class BasketPresenter {
    var basketViewController: PresenterToViewControllerBasketProtocol?
    var basketInteractor: PresenterToInteractorBasketProtocol?
}

extension BasketPresenter: ViewControllerToPresenterBasketProtocol {
    
    func setImage(imageView: UIImageView, foodName: String) {
        basketInteractor?.setImage(imageView: imageView, foodName: foodName)
    }
    
    func getBasket() {
        basketInteractor?.getBasket()
    }
    
    func updateBasket(basket: Basket) {
        basketInteractor?.updateBasket(basket: basket)
    }
    
    func deleteBasketFood(basketFoodId: String) {
        basketInteractor?.deleteBasketFood(basketFoodId: basketFoodId)
    }
    
    func saveOrder(basket: Basket) {
        basketInteractor?.saveOrder(basket: basket)
    }
    
    
}

extension BasketPresenter: InteractorToPresenterBasketProtocol {
    func sendBasketToViewController(basket: Basket) {
        basketViewController?.sendBasketToViewController(basket: basket)
    }
    
    
}
