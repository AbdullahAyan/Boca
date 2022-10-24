//
//  BasketProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerBasketProtocol {
    var basketView: BasketView? { get set }
    var basketPresenter: ViewControllerToPresenterBasketProtocol? { get set }
    
}

protocol ViewControllerToPresenterBasketProtocol {
    var basketViewController: ViewToViewControllerBasketProtocol? { get set }
    var basketInteractor: PresenterToInteractorBasketProtocol? { get set}
}

protocol PresenterToInteractorBasketProtocol {
    var basketPresenter: ViewControllerToPresenterBasketProtocol? { get set }
}

// MARK: - Router Protocol

protocol PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketViewController)
}
