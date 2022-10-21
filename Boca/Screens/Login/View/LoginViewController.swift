//
//  LoginViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    var loginPresenter: ViewControllerToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginRouter.createModule(ref: self)
        view = loginView
        view.backgroundColor = .white
    

    }


}

extension LoginViewController: ViewToViewControllerLoginProtocol {
    
    
    
}

