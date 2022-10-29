//
//  BasketViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class BasketViewController: UIViewController {

    var basketView: BasketView?
    var basketPresenter: ViewControllerToPresenterBasketProtocol?
    
    var basket = [Basket.BasketFood]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Sepet"

        BasketRouter.createModule(ref: self)
        
        basketView?.tableView.delegate = self
        basketView?.tableView.dataSource = self
        
        view = basketView
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Pacifico-Regular", size: 18)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    override func viewWillAppear(_ animated: Bool) {
        basketPresenter?.getBasket()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if !basket.isEmpty {
            basketPresenter?.updateBasket(basket: basket)
        }
    }
}

extension BasketViewController:UITableViewDelegate,UITableViewDataSource, ViewToViewControllerBasketProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasketTableViewCell
   
        cell.entity = Int(basket[indexPath.row].yemek_siparis_adet!)!
        cell.foodNameLabel.text = basket[indexPath.row].yemek_adi!
        basketPresenter?.setImage(imageView: cell.foodImageView, foodName: basket[indexPath.row].yemek_resim_adi!)
        cell.foodPriceLabel.text = basket[indexPath.row].yemek_fiyat! + " ₺"
        
        cell.entityChanged = { [self] change in
            basket[indexPath.row].yeni_entity = "\(cell.entity)"
            basketView?.totalPriceLabel.text = "\(calculateTotalAmount()) ₺"
            if cell.entity == 0 {
                basketPresenter?.deleteBasketFood(basketFoodId: basket[indexPath.row].sepet_yemek_id!)
                basket.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        
        basketView?.totalPriceLabel.text = "\(calculateTotalAmount()) ₺"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            basketPresenter?.deleteBasketFood(basketFoodId: basket[indexPath.row].sepet_yemek_id!)
            basket.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if basket.isEmpty {
                basketView?.totalPriceLabel.text = "0 ₺"
            }
            tableView.reloadData()

        }
    }

    func calculateTotalAmount() -> Int{
        var amount = 0
        for food in basket {
            amount += Int(food.yemek_fiyat!)! * Int((food.yeni_entity ?? food.yemek_siparis_adet)!)!
        }
        return amount
    }
}

extension BasketViewController: PresenterToViewControllerBasketProtocol {
    func sendBasketToViewController(basket: [Basket.BasketFood]) {
        self.basket = basket
        DispatchQueue.main.async {
            self.basketView?.tableView.reloadData()
        }
    }
}
