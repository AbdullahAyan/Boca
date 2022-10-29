//
//  BasketProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerBasketProtocol {
    var basketPresenter: ViewControllerToPresenterBasketProtocol? { get set }
    
}

protocol ViewControllerToPresenterBasketProtocol {
    var basketInteractor: PresenterToInteractorBasketProtocol? { get set}
    func changeEntityOf()
    func updateOrder()
}

protocol PresenterToInteractorBasketProtocol {
    func changeEntityOf()
    func updateOrder()
}
// MARK: - Transporter Protocols

protocol InteractorToPresenter {
    var basketViewController: PresenterToViewControllerBasketProtocol { get set }
    func sendOrderToView()
}

protocol PresenterToViewControllerBasketProtocol{
    func sendOrderToView()
}




// MARK: - Router Protocol

protocol PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketViewController)
}
