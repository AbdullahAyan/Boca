//
//  ProfileProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerProfileProtocol {
    var profileView: ProfileView? { get set }
    var profilePresenter: ViewControllerToPresenterProfileProtocol? { get set }
    
}

protocol ViewControllerToPresenterProfileProtocol {
    var profileViewController: ViewToViewControllerProfileProtocol? { get set }
    var profileInteractor: PresenterToInteractorProfileProtocol? { get set}
}

protocol PresenterToInteractorProfileProtocol {
    var profilePresenter: ViewControllerToPresenterProfileProtocol? { get set }
}

// MARK: - Router Protocol

protocol PresenterToRouterProfileProtocol {
    static func createModule(ref: ProfileViewController)
}
