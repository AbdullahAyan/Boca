//
//  ProfileInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import FirebaseAuth
import FirebaseCore

class ProfileInteractor {
    var profilePresenter: InteractorToPresenterProfileProtocol?
}

extension ProfileInteractor: PresenterToInteractorProfileProtocol {
    func logOut() {
        let user = Auth.auth()
        
        do {
            try user.signOut()
            if Auth.auth().currentUser?.email == nil {
                profilePresenter?.sendResponseToViewController(response: .Success)
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    
}
