//
//  MenuProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerMenuProtocol {
    var menuView: MenuView? { get set }
    var menuPresenter: ViewControllerToPresenterMenuProtocol? { get set }
    
}

protocol ViewControllerToPresenterMenuProtocol {
    var menuViewController: ViewToViewControllerMenuProtocol? { get set }
    var menuInteractor: PresenterToInteractorMenuProtocol? { get set}
}

protocol PresenterToInteractorMenuProtocol {
    var menuPresenter: ViewControllerToPresenterMenuProtocol? { get set }
}

// MARK: - Router Protocol

protocol PresenterToRouterMenuProtocol {
    static func createModule(ref: MenuViewController)
}
