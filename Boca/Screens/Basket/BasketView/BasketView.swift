//
//  BasketView.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

final class BasketView: UIView {

    var basketViewController: BasketViewController?
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Sipariş Ver", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()

        label.text = "44 ₺"
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
        
        let nib = UINib(nibName: "BasketTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        addSubview(orderButton)
        orderButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.right.equalToSuperview().offset(-100)
            make.height.equalTo(50)
        }
        
        addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(orderButton.snp.right).offset(-35)
            make.right.equalToSuperview().offset(-30)
            make.centerY.height.equalTo(orderButton)
        }
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(orderButton.snp.top).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


