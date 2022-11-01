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

        enum CodingKeys:String, CodingKey {
            case sepet_yemek_id
            case yemek_adi
            case yemek_resim_adi
            case yemek_fiyat
            case yemek_siparis_adet
            case kullanici_adi
            case yeni_entity
        }
    }
    var sepet_yemekler: [Basket.BasketFood]?
    
    enum CodingKeys: CodingKey {
        case sepet_yemekler
    }
}
