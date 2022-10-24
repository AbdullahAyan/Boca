//
//  BasketView.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class BasketView: UIView {

    var basketViewController: BasketViewController?
    
    private(set) lazy var tableView: UITableView = {
       let tableView = UITableView()
        
        return tableView
    }()
    
    private lazy var updateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Güncelle", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let nib = UINib(nibName: "BasketTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        addSubview(updateButton)
        updateButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.bottom.right.equalToSuperview().offset(-40)
            make.height.equalTo(50)
        }
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(updateButton.snp.top).offset(-10)
        }
        
        self.backgroundColor = .white
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


