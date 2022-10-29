//
//  MenuCollectionViewCell.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    var menuViewContoller: MenuViewController!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        
        button.addTarget(menuViewContoller, action: #selector(menuViewContoller.foodSelected) , for: .touchUpInside)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 1
        
        
        priceLabel.textColor = .white
        priceLabel.font = UIFont(name: "Mukta-Medium", size: 17)
        
        
        namelabel.textColor = .white
        namelabel.font = UIFont(name: "Mukta-Medium", size: 14)
        
        
        imageView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        imageView.layer.cornerRadius = 15

    }
}
