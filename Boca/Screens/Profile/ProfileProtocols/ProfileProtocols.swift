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
}

protocol ViewControllerToPresenterProfileProtocol {
    var profileInteractor: PresenterToInteractorProfileProtocol? { get set}
}

protocol PresenterToInteractorProfileProtocol {
}

// MARK: - Transporter Protocols

protocol InteractorToPresenterProfileProtocol {
    var profileViewControllerr: PresenterToViewControllerProfileProtocol? { get set }
    
}

protocol PresenterToViewControllerProfileProtocol {
}




// MARK: - Router Protocol

protocol PresenterToRouterProfileProtocol {
    static func createModule(ref: ProfileViewController)
}
