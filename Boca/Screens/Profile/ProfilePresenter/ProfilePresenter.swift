//
//  ProfilePresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

class ProfilePresenter {
    var profileInteractor: PresenterToInteractorProfileProtocol?
    var profileViewController: PresenterToViewControllerProfileProtocol?

}

extension ProfilePresenter: ViewControllerToPresenterProfileProtocol {
    func logOut() {
        profileInteractor?.logOut()
    }
}

extension ProfilePresenter: InteractorToPresenterProfileProtocol {
    func sendResponseToViewController(response: AuthResponse) {
        profileViewController?.sendResponseToViewController(response: response)
    }
}
