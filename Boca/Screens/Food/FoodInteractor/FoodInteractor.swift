//
//  FoodInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import Alamofire

class FoodInteractor {}

extension FoodInteractor: PresenterToInteractorFoodProtocol {
    func addToChart(food: Yemekler.Yemek, totalPrice: Double, entity: Int) {
        let params : Parameters = ["yemek_adi":food.yemek_adi!,"yemek_resim_adi":food.yemek_resim_adi!,"yemek_fiyat":food.yemek_fiyat!,"yemek_siparis_adet":entity,"kullanici_adi":User.email]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response { response in
            if let data  = response.data {
                do{
                    let _ = try JSONSerialization.jsonObject(with: data)
                }catch{ print(error.localizedDescription) }
            }
        }
    }
}
