//
//  FoodViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class FoodViewController: UIViewController {

//    Delegate objects
    var foodView: FoodView?
    var foodPresenter: ViewControllerToPresenterFoodProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Yemek Detayı"

        FoodRouter.createModule(ref: self)

        view = foodView
    }
    
    @objc func go() {
        navigationController?.pushViewController(BasketViewController(), animated: true)
    }


}

extension FoodViewController: ViewToViewControllerFoodProtocol {

    
    
}
