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
    
    func updateBasket(basket: [Basket.BasketFood]) {
        basketInteractor?.updateBasket(basket: basket)
    }
    
    func deleteBasketFood(basketFoodId: String) {
        basketInteractor?.deleteBasketFood(basketFoodId: basketFoodId)
    }
    
    

    
}

extension BasketPresenter: InteractorToPresenterBasketProtocol {
    func sendBasketToViewController(basket: [Basket.BasketFood]) {
        basketViewController?.sendBasketToViewController(basket: basket)
    }
    
    
}
