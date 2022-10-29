//
//  MenuPresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import Foundation
import UIKit

class MenuPresenter {
    var menuViewController: PresenterToViewControllerMenuProtocol?
    var menuInteractor: PresenterToInteractorMenuProtocol?
}

extension MenuPresenter: ViewControllerToPresenterMenuProtocol {
    func getAllFoods() {
        menuInteractor?.getAllFoods()
    }
    
    
    func setImage(imageView: UIImageView, foodName: String) {
        menuInteractor?.setImage(imageView: imageView, foodName: foodName)
    }
    
    
    func filterMenu(menu: [Yemekler.Yemek], searchText: String) {
        menuInteractor?.filterMenu(menu: menu, searchText: searchText)
    }
}

extension MenuPresenter: InteractorToPresenterMenuProtocol {
    func sendMenuToPresenter(menu: [Yemekler.Yemek]) {
        menuViewController?.sendMenuToViewController(menu: menu)
    }
}
