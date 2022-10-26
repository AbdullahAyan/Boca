//
//  ProfileRouter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation


class ProfileRouter: PresenterToRouterProfileProtocol {
    static func createModule(ref: ProfileViewController) {
        
//        MARK: - VIPER Components
        let view = ProfileView()
        
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor()
        
//        MARK: - View Delegates
        view.profileViewController = ref
 
//        MARK: - ViewController Delegates
        ref.profileView = view
        ref.profilePresenter = presenter
        

//        MARK: - Presenter Delegates
        presenter.profileInteractor = interactor
        presenter.profileViewController = ref

//        MARK: - Interactor Delegates
        interactor.profilePresenter = presenter
        
    }
}
