//
//  ProfileProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import UIKit

// MARK: - Main Protocols

protocol ViewToViewControllerProfileProtocol {
    var profilePresenter: ViewControllerToPresenterProfileProtocol? { get set }
    
    func logOut()
}

protocol ViewControllerToPresenterProfileProtocol {
    var profileInteractor: PresenterToInteractorProfileProtocol? { get set}
    
    func setUserInfo()
    func logOut()
    func saveChanges(email: String?, name: String?,image: UIImage?)
    func getOrders()
}

protocol PresenterToInteractorProfileProtocol {
    
    func setUserInfo()
    func logOut()
    func saveChanges(email: String?, name: String?,image: UIImage?)
    func getOrders()
}

// MARK: - Transporter Protocols

protocol InteractorToPresenterProfileProtocol {
    var profileViewController: PresenterToViewControllerProfileProtocol? { get set }
    func sendResponseToViewController(response: AuthResponse)
    func sendUserInfoToViewController(email: String,name: String?)
    func sendOrdersToViewController(baskets: [Basket])
}

protocol PresenterToViewControllerProfileProtocol {
    func sendResponseToViewController(response: AuthResponse)
    func sendUserInfoToViewController(email: String,name: String?)
    func sendOrdersToViewController(baskets: [Basket])



}




// MARK: - Router Protocol

protocol PresenterToRouterProfileProtocol {
    static func createModule(ref: ProfileViewController)
}
