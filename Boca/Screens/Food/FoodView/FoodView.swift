//
//  FoodView.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class FoodView: UIView {

    var foodViewController: FoodViewController?
    
    private(set) lazy var foodImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()

    
    private lazy var entityView: UIView = {
        var customView = UIView(frame: .infinite)
        
        let minusButton = UIButton(frame: .infinite)
        let entityLabel = UILabel(frame: .infinite)
        let plusButton = UIButton(frame: .infinite)
        
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.backgroundColor = .black
        minusButton.tintColor = .white
        minusButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30), forImageIn: .normal)
    
        
        entityLabel.text = "2"
        entityLabel.font = UIFont(name: "Mukta-Medium", size: 30)!
        entityLabel.textAlignment = .center
        entityLabel.backgroundColor = .white
        entityLabel.textColor = .black
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.backgroundColor = .black
        plusButton.tintColor = .white
        plusButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30), forImageIn: .normal)
        
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
        
        customView.layer.cornerRadius = 10
        customView.layer.cornerCurve = .circular
        customView.layer.masksToBounds = true

        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 0)
        customView.layer.shadowRadius = 3
        customView.layer.shadowOpacity = 0.5
        


        
        customView.layer.shouldRasterize = true
        return customView
    }()
    
    private lazy var addToChartbutton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Sepete Ekle", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.backgroundColor = .red
        
        button.layer.cornerRadius = 10
    
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        addSubview(addToChartbutton)
        addToChartbutton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
        addSubview(entityView)
        entityView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(100)

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
