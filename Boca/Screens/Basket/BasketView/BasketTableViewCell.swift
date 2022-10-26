//
//  BasketTableViewCell.swift
//  Boca
//
//  Created by Abdullah Ayan on 25.10.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodAmountLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    private lazy var entityView: UIView = {
        var customView = UIView(frame: .infinite)
        
        customView.layer.cornerRadius = 5.0
        customView.layer.masksToBounds = true

        customView.layer.borderColor = UIColor.lightGray.cgColor
        customView.layer.borderWidth = 1.5
        
        let minusButton = UIButton(frame: .infinite)
        let entityLabel = UILabel(frame: .infinite)
        let plusButton = UIButton(frame: .infinite)
        
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.backgroundColor = .black
        minusButton.tintColor = .white
        minusButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 12), forImageIn: .normal)
        
        entityLabel.text = "0"
        entityLabel.font = UIFont(name: "Mukta-Medium", size: 20)!
        entityLabel.textAlignment = .center
        entityLabel.backgroundColor = .white
        entityLabel.textColor = .black
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.backgroundColor = .black
        plusButton.tintColor = .white
        plusButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 12), forImageIn: .normal)
        
        customView.addSubview(minusButton)
        customView.addSubview(entityLabel)
        customView.addSubview(plusButton)
        
        minusButton.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
        }
        
        entityLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(minusButton.snp.right)
            make.width.equalTo(minusButton)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(entityLabel.snp.right)
            make.width.equalTo(entityLabel)

        }
        
        return customView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        addSubview(entityView)
        entityView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(35)
            make.right.equalToSuperview().offset(-16)
            make.width.equalTo(105)
        }

    }
    
    @IBAction func amountButtonClicked(_ sender: Any) {
        
    }
    
}
