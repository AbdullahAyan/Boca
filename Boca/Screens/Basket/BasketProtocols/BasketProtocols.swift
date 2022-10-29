//
//  BasketProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import UIKit

// MARK: - Main Protocols

protocol ViewToViewControllerBasketProtocol {
    var basketPresenter: ViewControllerToPresenterBasketProtocol? { get set }

}

protocol ViewControllerToPresenterBasketProtocol {
    var basketInteractor: PresenterToInteractorBasketProtocol? { get set}
    
    func getBasket()
    func updateBasket(basket: [Basket.BasketFood])
    func deleteBasketFood(basketFoodId: String)
    func setImage(imageView: UIImageView, foodName: String)
}

protocol PresenterToInteractorBasketProtocol {
    var basketPresenter: InteractorToPresenterBasketProtocol? { get set }
    
    func getBasket()
    func updateBasket(basket: [Basket.BasketFood])
    func deleteBasketFood(basketFoodId: String)
    func setImage(imageView: UIImageView, foodName: String)
}
// MARK: - Transporter Protocols

protocol InteractorToPresenterBasketProtocol {
    var basketViewController: PresenterToViewControllerBasketProtocol? { get set }
    
    func sendBasketToViewController(basket: [Basket.BasketFood])
}

protocol PresenterToViewControllerBasketProtocol{
    func sendBasketToViewController(basket: [Basket.BasketFood])
}




// MARK: - Router Protocol

protocol PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketViewController)
}
