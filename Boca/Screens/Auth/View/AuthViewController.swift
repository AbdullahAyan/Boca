//
//  AuthViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 20.10.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    var authView: AuthView?
    var authPresenter: ViewControllerToPresenterAuthProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthRouter.createModule(ref: self)
        view = authView

    }


}

extension AuthViewController: ViewToViewControllerAuthProtocol {
    
    
    
}

