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
    var food: Yemekler.Yemek
    
    init(foodView: FoodView? = nil, foodPresenter: ViewControllerToPresenterFoodProtocol? = nil, food: Yemekler.Yemek) {
        self.foodView = foodView
        self.foodPresenter = foodPresenter
        self.food = food
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Yemek Detayı"

        FoodRouter.createModule(ref: self)
        foodView?.initFood(food: food)

        view = foodView
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Pacifico-Regular", size: 18)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    
    
    @objc func go() {
        let ac = UIAlertController(title: "Ürün eklendi.", message: nil, preferredStyle: .alert)
        let goMenu = UIAlertAction(title: "Menüye Dön", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        let goBasket = UIAlertAction(title: "Sepete Git", style: .default) { _ in
            self.tabBarController?.selectedIndex = 1
        }
        ac.addAction(goMenu)
        ac.addAction(goBasket)
        present(ac, animated: true)
        }


}

extension FoodViewController: ViewToViewControllerFoodProtocol {

    
    
}
