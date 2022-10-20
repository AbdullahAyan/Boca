//
//  AuthProtocols.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import Foundation

// MARK: - Main Protocols

protocol ViewToViewControllerAuthProtocol {
    var authView: AuthView? { get set }
    var authPresenter: ViewControllerToPresenterAuthProtocol? { get set }
}

protocol ViewControllerToPresenterAuthProtocol {
    var authViewController: ViewToViewControllerAuthProtocol? { get set }
    var authInteractor: PresenterToInteractorAuthProtocol? { get set}
}

protocol PresenterToInteractorAuthProtocol {
    var authPresenter: ViewControllerToPresenterAuthProtocol? { get set }
}

// MARK: - Router Protocol

protocol PresenterToRouterAuthProtocol {
    static func createModule(ref: AuthViewController)
}

