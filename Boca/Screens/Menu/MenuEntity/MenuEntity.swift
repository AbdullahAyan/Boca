//
//  MenuEntity.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import Foundation

class Yemekler: Codable {
    class Yemek: Codable {
        let yemek_id: String?
        let yemek_adi: String?
        let yemek_resim_adi: String?
        let yemek_fiyat: String?
        
        init(yemek_id: String?, yemek_adi: String?, yemek_resim_adi: String?, yemek_fiyat: String?) {
            self.yemek_id = yemek_id
            self.yemek_adi = yemek_adi
            self.yemek_resim_adi = yemek_resim_adi
            self.yemek_fiyat = yemek_fiyat
        }
    }
    
    let yemekler: [Yemek]?
    let success: Int?
}
