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
    
    var basket = Basket()
    
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
        if !(basket.sepet_yemekler?.isEmpty ?? true) {
            basketPresenter?.updateBasket(basket: basket)
        }
    }
}

extension BasketViewController:UITableViewDelegate,UITableViewDataSource, ViewToViewControllerBasketProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket.sepet_yemekler?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasketTableViewCell
   
        cell.entity = Int(basket.sepet_yemekler![indexPath.row].yemek_siparis_adet!)!
        cell.foodNameLabel.text = basket.sepet_yemekler![indexPath.row].yemek_adi!
        basketPresenter?.setImage(imageView: cell.foodImageView, foodName: basket.sepet_yemekler![indexPath.row].yemek_resim_adi!)
        cell.foodPriceLabel.text = basket.sepet_yemekler![indexPath.row].yemek_fiyat! + " ₺"
        
        cell.entityChanged = { [self] change in
            basket.sepet_yemekler![indexPath.row].yeni_entity = "\(cell.entity)"
            basketView?.totalPriceLabel.text = "\(calculateTotalAmount()) ₺"
            if cell.entity == 0 {
                basketPresenter?.deleteBasketFood(basketFoodId: basket.sepet_yemekler![indexPath.row].sepet_yemek_id!)
                basket.sepet_yemekler!.remove(at: indexPath.row)
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
            basketPresenter?.deleteBasketFood(basketFoodId: basket.sepet_yemekler![indexPath.row].sepet_yemek_id!)
            basket.sepet_yemekler!.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if basket.sepet_yemekler!.isEmpty {
                basketView?.totalPriceLabel.text = "0 ₺"
            }
            tableView.reloadData()

        }
    }

    func calculateTotalAmount() -> Int{
        var amount = 0
        for food in basket.sepet_yemekler! {
            amount += Int(food.yemek_fiyat!)! * Int((food.yeni_entity ?? food.yemek_siparis_adet)!)!
        }
        return amount
    }
    
    @objc func saveOrder() {
        if !(basket.sepet_yemekler?.isEmpty ?? true) {
            basketPresenter?.saveOrder(basket: basket)
            presentAlert(title: "Kayıt Edilidi", message: "")
        }else {
            presentAlert(title: "Sepetiniz Boş", message: "Kayıt edilmedi.")
        }
    }
    
    func presentAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

extension BasketViewController: PresenterToViewControllerBasketProtocol {
    func sendBasketToViewController(basket: Basket) {
        self.basket = basket
        DispatchQueue.main.async {
            self.basketView?.tableView.reloadData()
        }
    }
}
