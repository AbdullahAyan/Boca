//
//  MenuProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import Foundation
import UIKit

// MARK: - Main Protocols

protocol ViewToViewControllerMenuProtocol {
    var menuPresenter: ViewControllerToPresenterMenuProtocol? { get set }
}

protocol ViewControllerToPresenterMenuProtocol {
    var menuViewController: PresenterToViewControllerMenuProtocol? { get set }
    var menuInteractor: PresenterToInteractorMenuProtocol? { get set}
    
    func getAllFoods()
    func setImage(imageView: UIImageView, foodName: String)
    func filterMenu(menu: [Yemekler.Yemek], searchText: String)
}

protocol PresenterToInteractorMenuProtocol {
    var menuPresenter: InteractorToPresenterMenuProtocol? { get set }
    
    func getAllFoods()
    func setImage(imageView: UIImageView, foodName: String)
    func filterMenu(menu: [Yemekler.Yemek], searchText: String)
}

// MARK: - Transporter Protocols

protocol InteractorToPresenterMenuProtocol {
    func sendMenuToPresenter(menu: [Yemekler.Yemek])
}

protocol PresenterToViewControllerMenuProtocol {
    func sendMenuToViewController(menu: [Yemekler.Yemek])
}

// MARK: - Router Protocol

protocol PresenterToRouterMenuProtocol {
    static func createModule(ref: MenuViewController)
}
