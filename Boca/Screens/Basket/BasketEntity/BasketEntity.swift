//
//  BasketEntity.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation

class Basket: Codable {
    class BasketFood: Codable {
        var sepet_yemek_id: String?
        var yemek_adi: String?
        var yemek_resim_adi: String?
        var yemek_fiyat: String?
        var yemek_siparis_adet: String?
        var kullanici_adi: String?
        var yeni_entity: String?
        
        
    }
    var sepet_yemekler: [Basket.BasketFood]?
}
