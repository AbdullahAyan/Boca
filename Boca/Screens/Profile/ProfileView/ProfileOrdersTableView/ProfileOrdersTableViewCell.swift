//
//  ProfileOrdersTableViewCell.swift
//  Boca
//
//  Created by Abdullah Ayan on 1.11.2022.
//

import UIKit
import SnapKit

class ProfileOrdersTableViewCell: UITableViewCell {
        
    private(set) lazy var orderNumber: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 40)
        return label
    }()
    
    private(set) lazy var orderTotalPrice: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 10)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(orderNumber)
        orderNumber.snp.makeConstraints { make in
            make.top.left.equalTo(safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.height.width.equalTo(40)
        }
        
        addSubview(orderTotalPrice)
        orderTotalPrice.snp.makeConstraints { make in
            make.centerY.equalTo(orderNumber)
            make.left.equalTo(orderNumber).offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    

    

}
