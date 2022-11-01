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

    func saveOrder()
}

protocol ViewControllerToPresenterBasketProtocol {
    var basketInteractor: PresenterToInteractorBasketProtocol? { get set}
    
    func getBasket()
    func updateBasket(basket: Basket)
    func deleteBasketFood(basketFoodId: String)
    func setImage(imageView: UIImageView, foodName: String)
    func saveOrder(basket: Basket)

}

protocol PresenterToInteractorBasketProtocol {
    var basketPresenter: InteractorToPresenterBasketProtocol? { get set }
    
    func getBasket()
    func updateBasket(basket: Basket)
    func deleteBasketFood(basketFoodId: String)
    func setImage(imageView: UIImageView, foodName: String)
    func saveOrder(basket: Basket)

}
// MARK: - Transporter Protocols

protocol InteractorToPresenterBasketProtocol {
    var basketViewController: PresenterToViewControllerBasketProtocol? { get set }
    
    func sendBasketToViewController(basket: Basket)
}

protocol PresenterToViewControllerBasketProtocol{
    func sendBasketToViewController(basket: Basket)
}




// MARK: - Router Protocol

protocol PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketViewController)
}
