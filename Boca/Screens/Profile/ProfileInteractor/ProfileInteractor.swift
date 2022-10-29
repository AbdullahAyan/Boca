//
//  ProfileInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

class ProfileInteractor {
    var profilePresenter: ViewControllerToPresenterProfileProtocol?
}

extension ProfileInteractor: PresenterToInteractorProfileProtocol {
    
}
