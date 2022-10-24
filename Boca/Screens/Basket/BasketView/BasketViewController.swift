//
//  BasketViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class BasketViewController: UIViewController {

//    Delegate objects
    var basketView: BasketView?
    var basketPresenter: ViewControllerToPresenterBasketProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Sepet"

        BasketRouter.createModule(ref: self)

        view = basketView
    }


}

extension BasketViewController: ViewToViewControllerBasketProtocol {

    
    
}
