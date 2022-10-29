//
//  BasketInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import UIKit
import Alamofire

class BasketInteractor {
    var basketPresenter: InteractorToPresenterBasketProtocol?
}

extension BasketInteractor: PresenterToInteractorBasketProtocol {
    
    func setImage(imageView: UIImageView, foodName: String) {
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/" + foodName)
        imageView.kf.setImage(with: url)
    }
    
    func getBasket() {
        let params: Parameters = ["kullanici_adi": User.email]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response { response in
            if let data  = response.data {
                do{
                    let response = try JSONDecoder().decode(Basket.self,from: data)
                    if let basket = response.sepet_yemekler {
                        for food in basket {
                            print(food.sepet_yemek_id)
                        }
                        self.basketPresenter?.sendBasketToViewController(basket: basket)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteBasketFood(basketFoodId: String) {
        let params: Parameters = ["sepet_yemek_id": basketFoodId, "kullanici_adi": User.email]
        let url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php"
        
        AF.request(url,method: .post,parameters: params).response { [self] response in
            if let data = response.data {
                do {
                    let response = try JSONSerialization.jsonObject(with: data)
                    print(response)
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func updateBasket(basket: [Basket.BasketFood]) {
        let lastId = basket[basket.count-1].sepet_yemek_id
        for food in basket {
            if food.yeni_entity != "0" {
                addFoodToBasket(food: food, entity: Int((food.yeni_entity ?? food.yemek_siparis_adet)!)!)
            }
            deleteBasketFood(basketFoodId: food.sepet_yemek_id!)
            if food.sepet_yemek_id == lastId {
                break
            }
        }
    }
    
    func addFoodToBasket(food: Basket.BasketFood, entity: Int) {
        let params: Parameters = ["yemek_adi":food.yemek_adi!,"yemek_resim_adi":food.yemek_resim_adi!,"yemek_fiyat":food.yemek_fiyat!,"yemek_siparis_adet":entity,"kullanici_adi":User.email]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response { response in
            if let data  = response.data {
                do{
                    let response = try JSONSerialization.jsonObject(with: data)
                    print(User.email)
                    print(response)
                }catch{
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
    

    
    
}
