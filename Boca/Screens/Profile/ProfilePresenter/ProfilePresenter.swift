//
//  ProfilePresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

class ProfilePresenter {
    var profileViewController: ViewToViewControllerProfileProtocol?
    var profileInteractor: PresenterToInteractorProfileProtocol?
}

extension ProfilePresenter: ViewControllerToPresenterProfileProtocol {

    
}
