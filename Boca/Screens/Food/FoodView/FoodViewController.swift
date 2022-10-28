//
//  FoodViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class FoodViewController: UIViewController {
    var foodView: FoodView?
    var foodPresenter: ViewControllerToPresenterFoodProtocol?
    
    var food: Yemekler.Yemek
    
    init(food: Yemekler.Yemek) {
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
    
    
    @objc func addToChart() {
        if let foodView {
            if foodView.totalPrice != 0 {
                foodPresenter?.addToChart(food: foodView.food!, totalPrice: foodView.totalPrice, entity: foodView.entity)
                present(sendAlert(title: "Ürün eklendi", message: nil, handler: { ac in
                    let goMenu = UIAlertAction(title: "Menüye Dön", style: .default) { _ in
                        self.navigationController?.popViewController(animated: true)
                    }
                    let goBasket = UIAlertAction(title: "Sepete Git", style: .default) { _ in
                        self.tabBarController?.selectedIndex = 1
                    }
                    
                    ac.addAction(goMenu)
                    ac.addAction(goBasket)
                    
                    return ac
                }), animated: true)
            } else {
                present(sendAlert(title: "Boş Ürün", message: "Sepete eklemek için lütfen adet seçiniz.", handler: { ac in
                    let ok = UIAlertAction(title: "OK", style: .default)
                    ac.addAction(ok)
                    
                    return ac
                }), animated: true)
            }
        } else {
            fatalError("Food not found.")
        }
    }
    
    
    @objc func updateEntity(sender: UIButton){
        if sender.tag == 0 {
            foodView?.entity += 1
        }
        if sender.tag == 1 {
            foodView?.entity -= 1
        }
    }
    
    func sendAlert(title: String,message: String? , handler: (UIAlertController) -> (UIAlertController)) -> UIAlertController {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return handler(ac)
    }
    
    
}

extension FoodViewController: ViewToViewControllerFoodProtocol {}
