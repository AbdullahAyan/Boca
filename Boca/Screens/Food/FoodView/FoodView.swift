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
        imageView.image = UIImage(systemName: "swift")
        
        return imageView
    }()
    
    private(set) lazy var foodNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift"
        label.font = UIFont(name: "Mukta-Medium", size: 60)
        label.textAlignment = .center

        return label
    }()
    
    private(set) lazy var foodPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "22 ₺"
        label.font = UIFont(name: "Mukta-Medium", size: 30)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var entityView: UIView = {
        var customView = UIView(frame: .infinite)
        
        customView.layer.cornerRadius = 10.0
        customView.layer.masksToBounds = true

        customView.layer.borderColor = UIColor.lightGray.cgColor
        customView.layer.borderWidth = 1.5
        
        let minusButton = UIButton(frame: .infinite)
        let entityLabel = UILabel(frame: .infinite)
        let plusButton = UIButton(frame: .infinite)
        
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.backgroundColor = .black
        minusButton.tintColor = .white
        minusButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 20), forImageIn: .normal)
        
        entityLabel.text = "0"
        entityLabel.font = UIFont(name: "Mukta-Medium", size: 20)!
        entityLabel.textAlignment = .center
        entityLabel.backgroundColor = .white
        entityLabel.textColor = .black
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.backgroundColor = .black
        plusButton.tintColor = .white
        plusButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 20), forImageIn: .normal)
        
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
    
    private lazy var addToChartbutton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Sepete Ekle", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.backgroundColor = .red
        
        button.layer.cornerRadius = 10
        button.addTarget(foodViewController, action: #selector(foodViewController!.go), for: .touchUpInside)
    
        return button
    }()
    
    private(set) lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "22 ₺"
        label.font = UIFont(name: "Mukta-Medium", size: 20)
        label.backgroundColor = .white
        label.textAlignment = .center

        
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true

        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 1.5
        
        return label
    }()
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        addSubview(foodImage)
        foodImage.snp.makeConstraints { make in
            make.top.left.right.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(foodImage.snp.height)
        }
        
        addSubview(foodNameLabel)
        foodNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(foodImage.snp.bottom).offset(10)
        }
        
        addSubview(foodPriceLabel)
        foodPriceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(foodNameLabel.snp.bottom).offset(-20)
        }
        
        addSubview(addToChartbutton)
        addToChartbutton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-110)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
        addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(addToChartbutton.snp.right).offset(-35)
            make.right.equalToSuperview().offset(-30)
            make.centerY.height.equalTo(addToChartbutton)
            
        }
        
        addSubview(entityView)
        entityView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
            make.height.equalTo(60)
            make.bottom.equalTo(addToChartbutton.snp.top).offset(-50)

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


