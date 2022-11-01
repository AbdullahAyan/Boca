//
//  ProfilePresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import UIKit

class ProfilePresenter {
    var profileInteractor: PresenterToInteractorProfileProtocol?
    var profileViewController: PresenterToViewControllerProfileProtocol?

}

extension ProfilePresenter: ViewControllerToPresenterProfileProtocol {
    func setUserInfo() {
        profileInteractor?.setUserInfo()
    }
    
    func saveChanges(email: String?, name: String?, image: UIImage?) {
        profileInteractor?.saveChanges(email: email, name: name, image: image)
    }
    
    func logOut() {
        profileInteractor?.logOut()
    }
    
    func getOrders() {
        profileInteractor?.getOrders()
    }
}

extension ProfilePresenter: InteractorToPresenterProfileProtocol {
    func sendOrdersToViewController(baskets: [Basket]) {
        profileViewController?.sendOrdersToViewController(baskets: baskets)
    }
    
    func sendUserInfoToViewController(email: String, name: String?) {
        profileViewController?.sendUserInfoToViewController(email: email, name: name)
    }
    
    func sendResponseToViewController(response: AuthResponse) {
        profileViewController?.sendResponseToViewController(response: response)
    }
}
