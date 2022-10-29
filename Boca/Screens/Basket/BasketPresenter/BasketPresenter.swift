//
//  BasketPresenter.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

class BasketPresenter {
    var basketViewController: ViewToViewControllerBasketProtocol?
    var basketInteractor: PresenterToInteractorBasketProtocol?
}

extension BasketPresenter: ViewControllerToPresenterBasketProtocol {

    
}
