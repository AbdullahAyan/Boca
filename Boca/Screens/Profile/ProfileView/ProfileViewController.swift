//
//  ProfileViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

//    Delegate objects
    var profileView: ProfileView?
    var profilePresenter: ViewControllerToPresenterProfileProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Profile"

        ProfileRouter.createModule(ref: self)
        


        view = profileView
    }


}

extension ProfileViewController: ViewToViewControllerProfileProtocol {
    
}


