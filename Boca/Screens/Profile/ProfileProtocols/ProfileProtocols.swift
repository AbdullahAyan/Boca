//
//  ProfileProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerProfileProtocol {
    var profilePresenter: ViewControllerToPresenterProfileProtocol? { get set }
    
    func logOut()
}

protocol ViewControllerToPresenterProfileProtocol {
    var profileInteractor: PresenterToInteractorProfileProtocol? { get set}
    func logOut()
}

protocol PresenterToInteractorProfileProtocol {
    func logOut()
}

// MARK: - Transporter Protocols

protocol InteractorToPresenterProfileProtocol {
    var profileViewController: PresenterToViewControllerProfileProtocol? { get set }
    func sendResponseToViewController(response: AuthResponse)
}

protocol PresenterToViewControllerProfileProtocol {
    func sendResponseToViewController(response: AuthResponse)

}




// MARK: - Router Protocol

protocol PresenterToRouterProfileProtocol {
    static func createModule(ref: ProfileViewController)
}
