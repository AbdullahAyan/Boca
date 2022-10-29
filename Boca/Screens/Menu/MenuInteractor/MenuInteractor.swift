//
//  MenuInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import Foundation
import Alamofire
import Kingfisher
import UIKit

class MenuInteractor {
    var menuPresenter: InteractorToPresenterMenuProtocol?
}

extension MenuInteractor: PresenterToInteractorMenuProtocol {
    func getAllFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(Yemekler.self, from: data)
                    if let menuResponse = response.yemekler {
                        self.menuPresenter?.sendMenuToPresenter(menu: menuResponse)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    
    func setImage(imageView: UIImageView, foodName: String) {
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/" + foodName)
        imageView.kf.setImage(with: url)
    }
    
    
    func filterMenu(menu: [Yemekler.Yemek], searchText: String) {
        var menu = menu
        let searchMenu = menu
        menu.removeAll()
        if searchText == "" {
            getAllFoods()
        }
        for food in searchMenu {
            if food.yemek_adi!.lowercased().contains(searchText.lowercased())  {
                menu.append(food)
            }
        }
        menuPresenter?.sendMenuToPresenter(menu: menu)
    }
}
